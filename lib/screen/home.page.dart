import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_doct_app/data/provider/home.provider.dart';
import 'package:new_doct_app/screen/appointment.page.dart';
import 'package:new_doct_app/screen/doctor.page.dart';
import 'package:new_doct_app/screen/profile.page.dart';
import 'package:new_doct_app/screen/search.page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Map<String, String>> doctorList = [
    {"imageUrl": "assets/ahmad.png", "name": "Dr. Ahmed Khan"},
    {"imageUrl": "assets/warner.png", "name": "Dr. Warner Miller"},
  ];

  List<Map<String, String>> medicinelist = [
    {"imageUrl": "assets/Amoxicillin.png", "name": "Amoxicillin"},
    {"imageUrl": "assets/Acetylcystein.png", "name": "Acetylcystein "},
  ];

  List<Map<String, String>> Featurelist = [
    {"imageUrl": "assets/doc.jfif"},
    {"imageUrl": "assets/doct.jfif"},
    {"imageUrl": "assets/docto.jfif"},
  ];
  int tabBottom = 0;
  @override
  Widget build(BuildContext context) {
    final box = Hive.box("userdata");
    final name = box.get("@name");

    final category = ref.watch(combinedDoctorDataProvider);
    return Scaffold(
      body: tabBottom == 0
          ? category.when(
              data: (snap) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 175.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                        color: Color(0xff163453),
                      ),
                      child: Column(
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
                                    "$name",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
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
                              Icon(
                                Icons.notifications_none,
                                color: Color(0xFFFFFFFF),
                              ),
                              SizedBox(width: 25.w),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: EdgeInsets.only(left: 23.w, right: 23.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 44.h,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                          horizontal: 20.w,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFFFFFFF),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xffD9D9D9),
                                        ),
                                        hintText: "Search",
                                        hintStyle: GoogleFonts.lexend(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xffD9D9D9),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          borderSide: BorderSide.none,
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
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.crop_free,
                                      color: Color(0xffD9D9D9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                top: 13.h,
                                right: 20.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SelectBody(
                                    image: "assets/laptop.png",
                                    txt: "Book Appointment",
                                  ),
                                  SelectBody(
                                    image: "assets/doctor.png",
                                    txt: "Instant Video Consult",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              margin: EdgeInsets.only(left: 20.w),
                              height: 130.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 105.w,
                                          height: 120.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFF1F1F1),
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.asset(
                                                  "assets/medicien.png",
                                                  width: MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                                  height: 90.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(height: 6.h),
                                              Text(
                                                "Medicines",
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000000),
                                                  letterSpacing: -0.80,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Text(
                                  "Specialities most relevant to you",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF171318),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            SizedBox(
                              height: 100.h,
                              // child: ListView(
                              //   scrollDirection: Axis.horizontal,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [

                              //         Specilist(
                              //           image: "assets/Teeth.png",
                              //           name: "Dentist",
                              //           bgColor: Color.fromARGB(
                              //             255,
                              //             234,
                              //             236,
                              //             255,
                              //           ),
                              //         ),
                              //         Specilist(
                              //           image: "assets/Cardiologist.png",
                              //           name: "Cardiologist",
                              //           bgColor: Color.fromARGB(
                              //             255,
                              //             234,
                              //             236,
                              //             255,
                              //           ),
                              //         ),
                              //         Specilist(
                              //           image: "assets/Pulmonologist.png",
                              //           name: "Pulmonologist",
                              //           bgColor: Color.fromARGB(
                              //             255,
                              //             234,
                              //             236,
                              //             255,
                              //           ),
                              //         ),
                              //         Specilist(
                              //           image: "assets/Physiotherapist.png",
                              //           name: "Physiotherapist",
                              //           bgColor: Color.fromARGB(
                              //             255,
                              //             234,
                              //             236,
                              //             255,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snap.doctorCategoryResponse.data.length,
                                itemBuilder: (context, index) {
                                  return Specilist(
                                    image: snap
                                        .doctorCategoryResponse
                                        .data[index]
                                        .imageUrl,
                                    name:
                                        "${snap.doctorCategoryResponse.data[index].name}",
                                    bgColor: Color.fromARGB(255, 234, 236, 255),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Text(
                                  "Specialists",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF171318),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "View all",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff163453),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff163453),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              //color: Colors.purple,
                              height: 270.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: snap.doctoresResponse.data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 20.w,
                                          top: 8.h,
                                        ),
                                        child: Container(
                                          width: 188.w,
                                          height: 250.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFF1F1F1),
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          16.r,
                                                        ),
                                                    child: Image.network(
                                                      // "assets/ahmad.png",
                                                      snap
                                                          .doctoresResponse
                                                          .data[index]
                                                          .imageUrl,
                                                      width: MediaQuery.of(
                                                        context,
                                                      ).size.width,
                                                      height: 140.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 12.w,
                                                    top: 12.h,
                                                    child: Container(
                                                      width: 32.w,
                                                      height: 32.h,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color: Color(
                                                            0xFF71717A,
                                                          ),
                                                          size: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 12.w,
                                                  top: 6.h,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snap.doctoresResponse.data[index].category}",
                                                      style:
                                                          GoogleFonts.plusJakartaSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                              0xFF71717A,
                                                            ),
                                                          ),
                                                    ),
                                                    Text(
                                                      // "Dr. Ahmed Khan",
                                                      snap
                                                              .doctoresResponse
                                                              .data[index]
                                                              .firstName +
                                                          " " +
                                                          snap
                                                              .doctoresResponse
                                                              .data[index]
                                                              .lastName,
                                                      style:
                                                          GoogleFonts.plusJakartaSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                              0xFF18181B,
                                                            ),
                                                          ),
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 12.w,
                                                      ),
                                                      child: Divider(
                                                        color: Color(
                                                          0xFFE4E4E7,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${snap.doctoresResponse.data[index].experience}+",
                                                      style:
                                                          GoogleFonts.plusJakartaSans(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                              0xFF18181B,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15.h),
                            // Row(
                            //   children: [
                            //     SizedBox(width: 20.w),
                            //     Text(
                            //       "Medicines",
                            //       style: GoogleFonts.lexend(
                            //         fontSize: 16.sp,
                            //         fontWeight: FontWeight.w600,
                            //         color: Color(0xFF171318),
                            //       ),
                            //     ),
                            //     Spacer(),
                            //     Text(
                            //       "View all",
                            //       style: GoogleFonts.inter(
                            //         fontSize: 13.sp,
                            //         fontWeight: FontWeight.w300,
                            //         color: Color(0xFF28318C),
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.arrow_forward_ios_rounded,
                            //       color: Color(0xFF28318C),
                            //       size: 16.sp,
                            //     ),
                            //     SizedBox(width: 20.w),
                            //   ],
                            // ),
                            // Container(
                            //   //color: Colors.purple,
                            //   height: 240.h,
                            //   child: ListView.builder(
                            //     padding: EdgeInsets.zero,
                            //     itemCount: medicinelist.length,
                            //     scrollDirection: Axis.horizontal,
                            //     itemBuilder: (context, index) {
                            //       return Column(
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsets.only(
                            //               left: 20.w,
                            //               top: 8.h,
                            //             ),
                            //             child: Container(
                            //               width: 185.w,
                            //               height: 219.h,
                            //               decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(
                            //                   8.r,
                            //                 ),
                            //                 border: Border.all(
                            //                   color: Color(0xFFE4E4E7),
                            //                   width: 1.w,
                            //                 ),
                            //               ),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Stack(
                            //                     children: [
                            //                       Image.asset(
                            //                         // "assets/ahmad.png",
                            //                         medicinelist[index]["imageUrl"]
                            //                             .toString(),
                            //                         width: MediaQuery.of(
                            //                           context,
                            //                         ).size.width,
                            //                         height: 112.h,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                       Positioned(
                            //                         left: 12.w,
                            //                         top: 12.h,
                            //                         child: Container(
                            //                           width: 32.w,
                            //                           height: 32.h,
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius.circular(
                            //                                   8.r,
                            //                                 ),
                            //                             color: Colors.white,
                            //                           ),
                            //                           child: Center(
                            //                             child: Icon(
                            //                               Icons.favorite_border,
                            //                               color: Color(
                            //                                 0xFF71717A,
                            //                               ),
                            //                               size: 20.sp,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                   Padding(
                            //                     padding: EdgeInsets.only(
                            //                       left: 12.w,
                            //                       top: 10.h,
                            //                     ),
                            //                     child: Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Text(
                            //                           // "Dr. Ahmed Khan",
                            //                           medicinelist[index]['name']
                            //                               .toString(),
                            //                           style:
                            //                               GoogleFonts.plusJakartaSans(
                            //                                 fontSize: 12.sp,
                            //                                 fontWeight:
                            //                                     FontWeight.bold,
                            //                                 color: Color(
                            //                                   0xFF18181B,
                            //                                 ),
                            //                               ),
                            //                         ),
                            //                         SizedBox(height: 5.h),
                            //                         Text(
                            //                           "200mg • 10 Capsule",
                            //                           style:
                            //                               GoogleFonts.plusJakartaSans(
                            //                                 fontSize: 12.sp,
                            //                                 fontWeight:
                            //                                     FontWeight.w400,
                            //                                 color: Color(
                            //                                   0xFF71717A,
                            //                                 ),
                            //                               ),
                            //                         ),
                            //                         SizedBox(height: 8.h),
                            //                         Row(
                            //                           children: [
                            //                             RichText(
                            //                               text: TextSpan(
                            //                                 style:
                            //                                     GoogleFonts.plusJakartaSans(
                            //                                       fontSize:
                            //                                           18.sp,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .bold,
                            //                                       color: Color(
                            //                                         0xFF18181B,
                            //                                       ),
                            //                                     ),
                            //                                 children: [
                            //                                   TextSpan(
                            //                                     text: '৳10.00',
                            //                                   ),
                            //                                   WidgetSpan(
                            //                                     alignment:
                            //                                         PlaceholderAlignment
                            //                                             .baseline,
                            //                                     baseline:
                            //                                         TextBaseline
                            //                                             .alphabetic,
                            //                                     child: Text(
                            //                                       '/ Strip',
                            //                                       style: GoogleFonts.plusJakartaSans(
                            //                                         fontSize:
                            //                                             12.sp,
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .w400,
                            //                                         color: Color(
                            //                                           0xFF71717A,
                            //                                         ),
                            //                                       ),
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                             Spacer(),
                            //                             Container(
                            //                               width: 24.w,
                            //                               height: 24.h,
                            //                               decoration: BoxDecoration(
                            //                                 borderRadius:
                            //                                     BorderRadius.circular(
                            //                                       8.r,
                            //                                     ),
                            //                                 color: Color(
                            //                                   0xFF28318C,
                            //                                 ),
                            //                               ),
                            //                               child: Center(
                            //                                 child: Icon(
                            //                                   Icons.add,
                            //                                   color:
                            //                                       Colors.white,
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                             SizedBox(width: 12.w),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       );
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 15.h),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  bottom: 10.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20.w),
                                        Text(
                                          "Free Questions",
                                          style: GoogleFonts.lexend(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF171318),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "View all",
                                          style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff163453),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color(0xff163453),
                                          size: 16.sp,
                                        ),
                                        SizedBox(width: 20.w),
                                      ],
                                    ),
                                    ListView.builder(
                                      itemCount: snap.qnaResponse.data.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            left: 6.w,
                                            right: 6.w,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              "Q: " +
                                                  snap
                                                      .qnaResponse
                                                      .data[index]
                                                      .title,
                                            ),
                                            subtitle: Text(
                                              "A: " +
                                                  snap
                                                      .qnaResponse
                                                      .data[index]
                                                      .description,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Text(
                                  "Testmonials",
                                  style: GoogleFonts.lexend(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF171318),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "View all",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff163453),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff163453),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                            Container(
                              //color: Colors.purple,
                              height: 220.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    snap.testimonials.data.testimonials.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 20.w,
                                          top: 8.h,
                                        ),
                                        child: Container(
                                          width: 161.w,
                                          height: 185.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFE4E4E7),
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Image.network(
                                            snap
                                                .testimonials
                                                .data
                                                .testimonials[index]
                                                .imageUrl
                                                .toString(),
                                            width: 161.w,
                                            height: 185.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        snap
                                            .testimonials
                                            .data
                                            .testimonials[index]
                                            .title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.w,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Text(
                                  "Most Decorated Doctors",
                                  style: GoogleFonts.lexend(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF171318),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "View all",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff163453),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff163453),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 90.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: Color(0xFFE4E4E7),
                                    width: 1.w,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 57.w,
                                        height: 57.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blueGrey,
                                        ),
                                        child: Image.asset("assets/four.png"),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dr. Name Four",
                                            style: GoogleFonts.lexend(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF101623),
                                            ),
                                          ),
                                          Text(
                                            "Telemedicine",
                                            style: GoogleFonts.lexend(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff163453),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Text(
                                  "Most Decorated Doctors",
                                  style: GoogleFonts.lexend(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF171318),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "View all",
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff163453),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff163453),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            SizedBox(
                              height: 100.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Specilist(
                                    image: snap
                                        .doctorCategoryResponse
                                        .data[index]
                                        .imageUrl,
                                    name: snap
                                        .doctorCategoryResponse
                                        .data[index]
                                        .name,
                                    bgColor: Color(0xFFE2F7F8),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 12.h),
                            SizedBox(
                              height: 100.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Specilist(
                                    image: snap
                                        .doctorCategoryResponse
                                        .data[index + 4]
                                        .imageUrl,
                                    name: snap
                                        .doctorCategoryResponse
                                        .data[index + 4]
                                        .name,
                                    bgColor: Color(0xFFE2F7F8),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              error: (err, stack) {
                return Center(child: CircularProgressIndicator());
              },
              loading: () => Center(child: CircularProgressIndicator()),
            )
          : tabBottom == 1
          ? SearchPage()
          : tabBottom == 2
          ? DoctorPage()
          : tabBottom == 3
          ? AppointmentPage()
          : ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabBottom,
        onTap: (value) {
          setState(() {
            tabBottom = value;
          });
        },
        selectedItemColor: Color(0xff163453),
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff163453),
        ),
        unselectedItemColor: Color(0xFF979C9E),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF979C9E),
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.stethoscope),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Appointment",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class Specilist extends StatelessWidget {
  final String image;
  final String name;
  final Color bgColor;
  const Specilist({
    super.key,
    required this.image,
    required this.name,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54.w,
          height: 54.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Center(
            child: Image.network(
              //"assets/eye.png",
              image,
            ),
          ),
        ),
        SizedBox(height: 9.h),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            // "Eye Specialist",
            name,
            style: GoogleFonts.lexend(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
              letterSpacing: -0.75,
            ),
          ),
        ),
      ],
    );
  }
}

class SelectBody extends StatelessWidget {
  final String image;
  final String txt;
  const SelectBody({super.key, required this.image, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 127.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFF1F1F1), width: 1.w),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width,
              height: 95.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            txt,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
              letterSpacing: -0.80,
            ),
          ),
        ],
      ),
    );
  }
}
