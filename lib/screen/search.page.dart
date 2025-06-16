

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_doct_app/data/provider/doctor.provider.dart';
import 'package:new_doct_app/screen/doctor.details.page.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
        final box = Hive.box("userdata");
    final name = box.get("@name");
    final data = ref.watch(doctorProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: data.when(
        data: (snap) {
          final filteredList = snap.data.where((doctor) {
            final fullName =
                '${doctor.firstName} ${doctor.lastName}'.toLowerCase();
            final category = doctor.category?.toLowerCase() ?? '';
            final address = doctor.address.toLowerCase();
            return fullName.contains(searchQuery) ||
                category.contains(searchQuery) ||
                address.contains(searchQuery);
          }).toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 55.h),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      width: 36.w,
                      height: 36.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Image.asset("assets/profile.png"),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Mirpur, Dhaka",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFB2BAC6),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications_none,
                        color: Color(0xFFD9D9D9)),
                    SizedBox(width: 25.w),
                  ],
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44.h,
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value.toLowerCase();
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 20.w),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xffD9D9D9),
                              ),
                              hintText: "Search",
                              hintStyle: GoogleFonts.lexend(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFBDBDBD),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: const Color(0xFFD9D9D9),
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: const Color(0xFFD9D9D9),
                                  width: 1.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: const Color(0xFFD9D9D9), width: 1.w),
                        ),
                        child: const Center(
                          child:
                              Icon(Icons.crop_free, color: Color(0xffD9D9D9)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 22.w),
                  child: Text(
                    "Frequently searched Specialities...",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9C9797),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0.w, top: 20.h, right: 0.w),
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final doctor = filteredList[index];
                      
                      return GestureDetector(
                        
                        onTap: () {
                          log(doctor.id);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>  DoctorDetailsPage(id: doctor.id.toString(),),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 71.w,
                                height: 70.h,
                                child: Image.network(
                                  doctor.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dr. ${doctor.firstName} ${doctor.lastName}',
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF28318C),
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.local_activity_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        doctor.address,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Text(
                                        "Details",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF7A7A7A),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      const Icon(Icons.info_outline, size: 20),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Container(
                                        width: 140.w,
                                        height: 34.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF28318C),
                                          borderRadius:
                                              BorderRadius.circular(5.26.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.wifi_calling_3_outlined,
                                              color: Colors.white,
                                              size: 16.sp,
                                            ),
                                            SizedBox(width: 9.w),
                                            Text(
                                              "Contact Clinic",
                                              style: GoogleFonts.urbanist(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Container(
                                        width: 56.w,
                                        height: 34.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.26.r),
                                          border: Border.all(
                                            color: const Color(0xFF28318C),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Info",
                                            style: GoogleFonts.urbanist(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF28318C),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, stack) {
          return Center(child: Text("Error: $err"));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
