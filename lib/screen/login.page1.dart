import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_doct_app/screen/login.page2.dart';
import 'package:new_doct_app/screen/mobilelogin.page.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 437.h,
            decoration: BoxDecoration(color: Color(0xFF28318C)),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Video consult top doctors from the\ncomfort of your home",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => MobileLoginPage(),
                      ),
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
        ],
      ),
    );
  }
}
