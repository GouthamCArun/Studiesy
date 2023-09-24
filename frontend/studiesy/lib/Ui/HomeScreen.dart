import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Ui/Transcription.dart';
import 'package:studiesy/Ui/chatScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> borderColors = [
    const Color(0xFFFFB3C1),
    const Color(0xFF00C9B8),
    const Color(0xFFFCD200),
    Colors.orangeAccent
  ];
  List<String> imageAssets = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
  ];
  List subjects = [
    'Physics',
    'Maths',
    'Politics',
    'Chemistry',
    'Computer Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(248, 249, 163, 255),
              Color.fromARGB(255, 255, 251, 238),
            ],
          ),
        ),
        child: SafeArea(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
              child: Text(
                'Learn Live',
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
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      height: 70.0,
                      width: 70.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 2,
                            color: borderColors[i],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TranscriptionPage()),
                            );
                          },
                          child: ClipOval(
                            child: Container(
                              color: borderColors[i],
                              child: Center(
                                child: Image.asset(
                                  imageAssets[i],
                                  height: 40.0,
                                  width: 40.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
              child: Text(
                'Your Subjects',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: const Color.fromARGB(255, 128, 128, 128),
                  ),
                ),
              ),
            ),
            genNotes()
          ],
        )),
      ),
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
                          Color.fromARGB(248, 244, 87, 255),
                          Color.fromARGB(248, 143, 75, 147)
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
                            color: const Color.fromARGB(255, 255, 255, 255),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConversationScreen(
                                  chatRoomId: 'dfdf',
                                  userName: 'sdsdsdsd',
                                ),
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
