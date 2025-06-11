import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_doct_app/screen/login.page3.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        actions: [
          Row(
            children: [
              Icon(Icons.help_outline),
              Text(
                "Help",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(153, 0, 0, 0),
                ),
              ),
              SizedBox(width: 26.w),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Text(
              "Let's get started! Enter your mobile number",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 14.h),
            TextField(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginPage3()),
                );
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: Color(0xFF000000),
                    width: 0.5.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: Color(0xFF000000),
                    width: 0.5.w,
                  ),
                ),
                //prefixIcon: Container(child: Text("+91")),
                hintText: "Mobile number",
                hintStyle: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(153, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Trouble signing in?",
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(153, 0, 0, 0),
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(153, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
