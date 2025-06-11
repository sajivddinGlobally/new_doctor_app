import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_doct_app/screen/appointment.booking.page.dart';

class DoctorTimePage extends StatefulWidget {
  const DoctorTimePage({super.key});

  @override
  State<DoctorTimePage> createState() => _DoctorTimePageState();
}

class _DoctorTimePageState extends State<DoctorTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60.h,
            decoration: BoxDecoration(color: Color(0xFF28318C)),
            child: Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Image.asset("assets/Avatar.png"),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Emma Kathrin",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Cardiologist",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "MBBS",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22.w),
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1896F2),
                ),
                child: Center(
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Clinic Visit Slots",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Color(0xFFA7A7A7), thickness: 1.w),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Purpose Of visit",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  "Consultation",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 71.h,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(color: Color(0xFFE9E9E9)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  DateBody(day: "Today, 17 May", available: " Slots available"),
                  DateBody(
                    day: "Tomorrow, 18 May",
                    available: "10 Slots available",
                  ),
                  DateBody(day: "Mon, 19 May", available: "34 Slots available"),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Center(
            child: Text(
              "Today, 17 May",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
                letterSpacing: -1,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Divider(color: Color(0xFFA7A7A7), thickness: 1.w),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.sunny),
                SizedBox(height: 10.h),
                Text.rich(
                  TextSpan(
                    text: "Afternoon ",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -1,
                    ),
                    children: [
                      TextSpan(
                        text: ' 5 slots',
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                SizedBox(width: 20.w),
                TimeBody(time: "01:45 PM"),
                TimeBody(time: "01:45 PM"),
                TimeBody(time: "01:45 PM"),
                TimeBody(time: "01:45 PM"),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.nightlight_outlined),
                SizedBox(height: 10.h),
                Text.rich(
                  TextSpan(
                    text: "Evening ",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -1,
                    ),
                    children: [
                      TextSpan(
                        text: ' 1 slot',
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.w, top: 20.h),
                  width: 89.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF1896F2), width: 1.w),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: Text(
                      "05:15 PM",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1896F2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
                          builder: (context) => AppointmentBookingPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Continue",
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
        ],
      ),
    );
  }
}

class TimeBody extends StatelessWidget {
  final String time;
  const TimeBody({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 89.w,
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1896F2), width: 1.w),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
        child: Text(
          time,
          style: GoogleFonts.inter(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1896F2),
          ),
        ),
      ),
    );
  }
}

class DateBody extends StatelessWidget {
  final String day;
  final String available;
  const DateBody({super.key, required this.day, required this.available});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 116.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Color(0xFF1896F2), width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
              letterSpacing: -1,
            ),
          ),
          Text(
            available,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF357A7B),
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }
}
