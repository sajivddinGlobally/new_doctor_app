import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_doct_app/data/provider/doctor.provider.dart';
import 'package:new_doct_app/screen/doctor.time.page.dart';

class DoctorDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const DoctorDetailsPage({super.key, required this.id});

  @override
  ConsumerState<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends ConsumerState<DoctorDetailsPage> {
  int tabBo = 0;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(perticulerDocotrProvider(widget.id));
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFFFFF),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, size: 22.sp),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        actions: [
          Icon(Icons.star_border, size: 22.sp),
          SizedBox(width: 10.w),
          Image.asset("assets/share.png"),
          SizedBox(width: 20.w),
        ],
      ),
      body: data.when(
        data: (snap) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Container(
                        width: 96.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                          image: DecorationImage(
                            image: NetworkImage("${snap.doctorDetails.image}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. ${snap.doctorDetails.name}",
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF101623),
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "${snap.doctorDetails.categoryName}",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF28318C),
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "MBBS",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8C8C8C),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFFFBA55)),
                              SizedBox(width: 6.w),
                              Text(
                                "${snap.doctorDetails.rating}",
                                style: GoogleFonts.lexend(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF101623),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Rating & Review",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA1A8B0),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 2.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(89, 194, 201, 221),
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.card_travel, color: Color(0xFF9ED4D6)),
                              SizedBox(width: 6.w),
                              Text(
                                "${snap.doctorDetails.experience}",
                                style: GoogleFonts.lexend(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF101623),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Years of work",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA1A8B0),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 2.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(89, 194, 201, 221),
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.group_outlined,
                                color: Color(0xFF9ED4D6),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "125",
                                style: GoogleFonts.lexend(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF101623),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "No. of patients",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA1A8B0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 335.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.91.r),
                      color: Color.fromARGB(30, 118, 118, 118),
                      border: Border.all(color: Color(0xFF000000), width: 1.w),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tabBo = 0;
                            });
                          },
                          child: Container(
                            width: 100.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r),
                              boxShadow: [
                                if (tabBo == 0)
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    color: Color.fromARGB(30, 0, 0, 0),
                                  ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Info",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(91, 60, 60, 67),
                          endIndent: 5,
                          indent: 5,
                        ),
                        Container(
                          width: 100.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7.r),
                            boxShadow: [
                              if (tabBo == 1)
                                BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  color: Color.fromARGB(30, 0, 0, 0),
                                ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "History",
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(91, 60, 60, 67),
                          endIndent: 5,
                          indent: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tabBo = 2;
                            });
                          },
                          child: Container(
                            width: 96.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r),
                              boxShadow: [
                                if (tabBo == 2)
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    color: Color.fromARGB(30, 0, 0, 0),
                                  ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Review",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    height: 300.h,
                    padding: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Color(0xFFF4F4F4), width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width,
                          // height: 48.h,
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 14.h,
                            bottom: 14.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            ),
                            color: Color(0xFFDADDFF),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "In-Clinic Appointment",
                                style: GoogleFonts.inter(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                  letterSpacing: -1,
                                ),
                              ),
                              Text(
                                "₹${snap.clinicStory.fee}",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF28318C),
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snap.clinicStory.name}",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000),
                                  letterSpacing: -1,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Text(
                                    snap.clinicStory.city,
                                    style: GoogleFonts.inter(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF28318C),
                                    ),
                                  ),
                                  SizedBox(width: 60.w),
                                  // Text(
                                  //   "2 More clinic ",
                                  //   style: GoogleFonts.inter(
                                  //     fontSize: 11.sp,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: Color(0xFF47BAFF),
                                  //     decoration: TextDecoration.underline,
                                  //     decorationColor: Color(0xFF47BAFF),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                snap.clinicStory.seatingDays,
                                style: GoogleFonts.inter(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF8C8C8C),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(color: Color(0xFFF4F4F4), thickness: 1.w),
                        Expanded(
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: TabBar(
                                    isScrollable: true,
                                    indicatorColor: Color(0xFF28318C),
                                    labelColor: Color(0xFF000000),
                                    unselectedLabelColor: Color(0xFF9A97AE),
                                    indicatorWeight: 2.w,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    tabs: [
                                      Tab(
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Time ",
                                            style: GoogleFonts.inter(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '(No Slot)',
                                                style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF8C8C8C),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Tomorrow ",
                                            style: GoogleFonts.inter(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '(20 Slot)',
                                                style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF47BAFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text.rich(
                                          TextSpan(
                                            text: "17 Oct ",
                                            style: GoogleFonts.inter(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '(20 Slot)',
                                                style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF47BAFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 10.w,
                                                  top: 10.h,
                                                ),
                                                width: 104.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        20.r,
                                                      ),
                                                  color: Color(0xFFDADDFF),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "06:00 - 06:30",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF28318C),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: 2,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                width: 400,
                                                height: 100,
                                                color: Colors.amber,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: 2,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                width: 400,
                                                height: 100,
                                                color: Colors.black,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Timing",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10.w),
                          width: 155.w,
                          height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Color(0xFFF4F4F4),
                              width: 1.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Monday",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF424242),
                                    letterSpacing: -1,
                                  ),
                                ),
                                Text(
                                  "09:00 AM - 05:00 PM",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF8C8C8C),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Location",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10.w),
                          width: 155.w,
                          height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Color(0xFFF4F4F4),
                              width: 1.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shahbag",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF424242),
                                    letterSpacing: -1,
                                  ),
                                ),
                                Text(
                                  "BSSMU - Bangaband..",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF8C8C8C),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Center(
                  //   child: Text("Map Here ", style: TextStyle(fontSize: 30.sp)),
                  // ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300.w, 40.h),
                        backgroundColor: Color(0xFF1896F2),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => DoctorTimePage(),
                          ),
                        );
                      },
                      child: Text(
                        "Book",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        },
        error: (err, stack) {
          return Center(child: Text("$err"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
