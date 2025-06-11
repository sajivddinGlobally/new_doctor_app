import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_doct_app/screen/doctor.details.page.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "My Appointments",
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000),
          ),
        ),
        actions: [
          Icon(Icons.calendar_month_outlined, color: Color(0xFF000000)),
          SizedBox(width: 20.w),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: SizedBox(
              height: 44.h,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  prefixIcon: Icon(Icons.search, color: Color(0xffD9D9D9)),
                  hintText: "Search by name or role",
                  hintStyle: GoogleFonts.lexend(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFBDBDBD),
                    letterSpacing: -1,
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
                  suffixIcon: Icon(Icons.tune),
                ),
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Color(0xFF28318C),
                    labelColor: Color(0xFF000000),
                    unselectedLabelColor: Color(0xFF9A97AE),
                    indicatorWeight: 2.w,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Text(
                          "Upcoming",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Pending",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Past",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Cancelled",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => DoctorDetailsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 20.w,
                                    top: 20.h,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 71.w,
                                        height: 70.h,
                                        child: Image.asset(
                                          "assets/doctorman.png",
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Appointment with ',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF000000),
                                                    letterSpacing: -1,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Dr. Ahmed Khan',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF28318C),
                                                    letterSpacing: -1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 14.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month_outlined,
                                                size: 20.sp,
                                              ),
                                              Text(
                                                "Wed, 10th May",
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF000000),
                                                  letterSpacing: -1,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Icon(
                                                Icons.timer_outlined,
                                                size: 20.sp,
                                              ),
                                              Text(
                                                "Wed, 10th May",
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF000000),
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
                                                  color: Color(0xFF7A7A7A),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Icon(
                                                Icons.info_outline,
                                                size: 20.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            children: [
                                              Container(
                                                width: 140.w,
                                                height: 34.h,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF28318C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        5.26.r,
                                                      ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .wifi_calling_3_outlined,
                                                      color: Colors.white,
                                                      size: 16.sp,
                                                    ),
                                                    SizedBox(width: 9.w),
                                                    Text(
                                                      "Contact Clinic",
                                                      style:
                                                          GoogleFonts.urbanist(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                      BorderRadius.circular(
                                                        5.26.r,
                                                      ),
                                                  border: Border.all(
                                                    color: Color(0xFF28318C),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Info",
                                                    style: GoogleFonts.urbanist(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF28318C),
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
                                  color: Colors.purple,
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
    );
  }
}
