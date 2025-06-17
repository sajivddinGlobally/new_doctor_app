import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentBookingPage extends StatefulWidget {
  const AppointmentBookingPage({super.key});

  @override
  State<AppointmentBookingPage> createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  bool isChecked = false;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45.h),
            Row(
              children: [
                SizedBox(width: 22.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.w),
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff163453),
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
                  "Book In-Clinic AppointMent",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7)),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: Image.asset(
                          "assets/Avatar.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Emma Kathrin",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF101623),
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "Cardiologist",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8C8C8C),
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
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        // width: 57.w,
                        // height: 16.h,
                        padding: EdgeInsets.only(
                          left: 6.w,
                          right: 6.w,
                          top: 3.h,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          border: Border.all(
                            color: Color(0xff163453),
                            width: 0.5.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: Color(0xff163453),
                              size: 14.sp,
                            ),
                            Text(
                              "In-Clinic",
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff163453),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.thumb_up,
                        size: 15.sp,
                        color: Color(0xFF357A7B),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "87%",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.message,
                        size: 15.sp,
                        color: Color(0xFF357A7B),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "970 Patient Stories",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        child: Checkbox(
                          focusColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1.w),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "Highly Recommended For Doctor Friendliness",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7), thickness: 5.w),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 18.sp),
                      SizedBox(width: 5.h),
                      Text(
                        "Appointment time",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Sat, 17 May 01:45 PM",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(width: 5.h),
                      Text(
                        "|",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(width: 5.h),
                      Icon(
                        Icons.timer_outlined,
                        size: 18.sp,
                        color: Color.fromARGB(122, 0, 0, 0),
                      ),
                      SizedBox(width: 5.h),
                      Text(
                        "in 1 hour and 9 minutes",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(122, 0, 0, 0),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7), thickness: 5.w),
            Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Icon(Icons.home_outlined, size: 18.sp),
                      SizedBox(width: 5.h),
                      Text(
                        "Clinic Details",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Marvel Multispecialty Hospital, Number 453, 1st Cross, Koramangala 1 Block",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    // width: 318.w,
                    // height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color(0xFF8A8A8A),
                        width: 0.5.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/persentage.png"),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apply Coupon",
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000),
                                letterSpacing: -1,
                              ),
                            ),

                            Text(
                              "Unlock offers with coupon Codes",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(127, 0, 0, 0),
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Apply",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff163453),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Bill Details",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Consultation Fee",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(127, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "₹ 1000",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(127, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Service Fee & Tax",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(127, 0, 0, 0),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "₹49 ",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(127, 0, 0, 0),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "free",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF357A7B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "We Care for you & provide a free booking",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF357A7B),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: Color(0xFFA7A7A7)),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payable",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        "₹ 1000",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(4.r),
                      color: Color(0xFF357A7B),
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 9.h,
                        bottom: 9.h,
                      ),
                      // dashPattern: [2, 3],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You have saved ₹ 49 on this appointment",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF357A7B),
                            letterSpacing: -1,
                          ),
                        ),
                        Image.asset("assets/rat.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7), thickness: 5.w),
            SizedBox(height: 14.h),
            Container(
              margin: EdgeInsets.only(left: 35.w),
              width: 87.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(51, 40, 49, 140),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.health_and_safety_outlined, size: 16.sp),
                  Text(
                    "Safe visit",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Safety measures followed by Clinic",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SafeBody(txt: "Mask Mandatory"),
                  SizedBox(height: 10.h),
                  SafeBody(txt: "Temperature check at entrance"),
                  SizedBox(height: 10.h),
                  SafeBody(txt: "Sanitization of this visitors"),
                  SizedBox(height: 10.h),
                  SafeBody(txt: "Social distance maintained"),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7), thickness: 5.w),
            Padding(
              padding: EdgeInsets.only(left: 35.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        child: Checkbox(
                          focusColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1.w),
                          value: isCheck,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheck = value ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Get notification on whatsapp",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
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
                      Container(
                        width: 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(153, 0, 0, 0),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Updates will be sent to +917525698575.",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(153, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text:
                              "By booking the appointment, you agree to Practo’s ",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(153, 0, 0, 0),
                            letterSpacing: -1,
                          ),
                          children: [
                            TextSpan(
                              text: "Term and conditions.",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff163453),
                                letterSpacing: -1,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "you can also Pre-pay for this appointment by selecting Pay Online option. you can read our payment",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(153, 0, 0, 0),
                                letterSpacing: -1,
                              ),
                            ),
                            TextSpan(
                              text: " FaQs .",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff163453),
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFA7A7A7), thickness: 5.w),
            Container(
              padding: EdgeInsets.only(
                left: 40.w,
                right: 40.w,
                top: 16.h,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(color: Color(0xFFECEDFF)),
              child: Row(
                children: [
                  Container(
                    width: 34.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "J",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "In-Clinic Appointment for",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        "Juned shekh",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Change",
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff163453),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹1000",
                        style: GoogleFonts.inter(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        "View Bill",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff163453),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 221.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Color(0xFF1896F2),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm Clinic Visit",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class SafeBody extends StatelessWidget {
  final String txt;
  const SafeBody({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF000000),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          txt,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}
