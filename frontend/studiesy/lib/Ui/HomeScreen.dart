import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEDE3),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.h, left: 5.w),
            child: Text(
              'Hey Rafe👋',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                  color: const Color.fromARGB(255, 57, 2, 78),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
            child: Text(
              'What do you want to learn today?',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color.fromARGB(255, 128, 128, 128),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            child: SearchBar(
              hintText: 'Search',
              leading: Icon(
                Icons.search,
                size: 25.sp,
                color: Colors.grey,
              ),
              hintStyle: MaterialStatePropertyAll(
                GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(220, 224, 255, 0.843),
              ),
              shape: MaterialStatePropertyAll(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.sp),
                  ),
                ),
              ),
            ),
          ),
          genNotes()
        ],
      )),
    );
  }

  genNotes() {
    return Expanded(
      child: GridView.builder(
          itemCount: 4,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 9 / 12, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(1.5.w),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 144, 78, 223),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, left: 3.w),
                      child: Text(
                        'Physics',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Text(
                        '10 Sep 2023',
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.5.w, vertical: 0.5.h),
                      child: Text(
                        'Electromagnets',
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
