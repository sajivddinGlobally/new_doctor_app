import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_doct_app/core/network/api.state.dart';
import 'package:new_doct_app/core/utils/preety.dio.dart';
import 'package:new_doct_app/data/model/login.body.dart';
import 'package:new_doct_app/screen/home.page.dart';
import 'package:new_doct_app/screen/otp.page.dart';

class MobileLoginPage extends StatefulWidget {
  final String mobileNo;
  const MobileLoginPage({super.key, required this.mobileNo});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  bool btnLoder = false;
  final _passwordController = TextEditingController();
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
              "Let's get started! Enter your password",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 14.h),
            TextField(
              controller: _passwordController,
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
                hintText: "Password",
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
            SizedBox(height: 50.h),
            Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    btnLoder = true;
                  });
                  final service = APIStateNetwork(await createDio());
                  try{
                    final response = await service.login(
                    LoginBody(
                      mobileNumber: widget.mobileNo,
                      password: _passwordController.text,
                    ),
                  );
                  if (response.response.data["success"] == true) {
                    final box = await Hive.box('userdata');
                    await box.put("@id", response.data.data.id.toString());
                    await box.put(
                      "@name",
                      "${response.data.data.firstName} ${response.data.data.lastName}",
                    );
                    await box.put("@email", response.data.data.email);
                    await box.put("@phone", response.data.data.mobileNumber);
                    await box.put(
                      "@token",
                      response.data.data.token.toString(),
                    );

                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => HomePage()),
                    );
                    Fluttertoast.showToast(
                      msg: "Login success",
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "${response.data.message}",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                    setState(() {
                      btnLoder = false;
                    });
                  }
                  }catch (e) {
                    setState(() {
                      btnLoder = false;
                    });
                     Fluttertoast.showToast(
                      msg: "Invalid mobile number or password",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                    
                  }
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(builder: (context) => HomePage()),
                  // );
                },
                child: Container(
                  width: 230.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0xFF1896F2),
                  ),
                  child: Center(
                    child: btnLoder == true
                        ? CircularProgressIndicator(strokeWidth: 2,color: Colors.white,)
                        : Text(
                            "Continue",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
