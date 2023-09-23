import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Ui/chatScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List subjects = [
    'Physics',
    'Maths',
    'Politics',
    'Chemistry',
    'Computer Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 247, 244),
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
          itemCount: subjects.length,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 9 / 13, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(1.5.w),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(186, 142, 237, 1),
                          Color.fromRGBO(154, 91, 232, 1),
                        ]),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.5.h, left: 4.w),
                      child: Text(
                        subjects[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            height: 1,
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                        horizontal: 4.w,
                      ),
                      child: Text(
                        'Mr.Raguram',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'Electromagnets',
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                        overflow: TextOverflow.fade,
                        maxLines: 4,
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 220, 220, 220),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
            builder: (context) => const ConversationScreen(chatRoomId: 'dfdf', userName: 'sdsdsdsd',),
          ),
          );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
