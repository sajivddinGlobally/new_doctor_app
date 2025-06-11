import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, String>> searchList = [
    {"txt": "Dentist"},
    {"txt": "Gynecologist/obstetrician"},
    {"txt": "general Physician"},
    {"txt": "Dermatologist"},
    {"txt": "Ear-nose-throat(ent) Specialist"},
    {"txt": "Homoeopath"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
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
                  decoration: BoxDecoration(
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
                      "Tanvir Ahassan",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text(
                      "Mirpur, Dhaka",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB2BAC6),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.notifications_none, color: Color(0xFFD9D9D9)),
                SizedBox(width: 25.w),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 22.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44.h,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.w,
                            horizontal: 20.w,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffD9D9D9),
                          ),
                          hintText: "Search",
                          hintStyle: GoogleFonts.lexend(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFBDBDBD),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
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
                      //color: Color(0xFFFFFFFF),
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1.w),
                    ),
                    child: Center(
                      child: Icon(Icons.crop_free, color: Color(0xffD9D9D9)),
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
                  color: Color(0xFF9C9797),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w, top: 20.h, right: 22.w),
              child: ListView.builder(
                itemCount: searchList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.call_made, color: Color(0xFF9C9797)),
                            SizedBox(width: 10.w),
                            Text(
                              //"Dentist",
                              searchList[index]['txt'].toString(),
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9C9797),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Divider(color: Color.fromARGB(76, 0, 0, 0)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
