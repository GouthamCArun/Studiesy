import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Ui/Transcription.dart';
import 'package:studiesy/Ui/chatScreen.dart';
import 'package:studiesy/models/databaseMethods.dart';

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
    'Mathematics',
    'English',
    'Chemistry',

  ];

  Stream? notes;

  @override
  void initState() {
    DataBaseMethods().getNotes().then((val) {
      notes = val;
      QuerySnapshot snapshotqi = val;
      print(snapshotqi.docs[0]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h, left: 5.w),
              child: Text(
                'Hey buddy👋',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: const Color.fromARGB(255, 133, 1, 186),
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
      child:GridView.builder(
              itemCount: subjects.length,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
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
                          padding: EdgeInsets.only(
                            top: 1.5.h,
                            left: 4.w,
                          ),
                          child: Text(
                            subjects[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: GoogleFonts.poppins(
                                height: 1,
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700),
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
                            'Chemical bonding is a fundamental concept in chemistry that describes how atoms and molecules come together to form compounds. It is the glue that holds matter together and is crucial in understanding the behavior of substances in the physical world. There are several types of chemical bonding, each characterized by the way atoms share or transfer electrons to achieve a stable, lower-energy state.  The three primary types of chemical bonding are:  Ionic Bonding: Ionic bonding occurs when atoms transfer electrons to one another, resulting in the formation of ions. One atom loses electrons to become positively charged (cation), while the other gains those electrons to become negatively charged (anion). These oppositely charged ions are attracted to each other, creating a strong electrostatic force that holds them together. Common examples of ionic compounds include table salt (sodium chloride, NaCl) and calcium carbonate (CaCO3).  Covalent Bonding: Covalent bonding involves the sharing of electrons between atoms to achieve a stable electron configuration. In a covalent bond, atoms share one or more pairs of electrons, and this sharing creates a strong attraction between the nuclei of the bonded atoms and the shared electrons. Covalent bonds are typically found in molecules made up of nonmetals. Water (H2O) and methane (CH4) are examples of molecules held together by covalent bonds.  Metallic Bonding: Metallic bonding is unique to metals and is responsible for many of their characteristic properties. In metallic bonding, atoms within a metal lattice share their electrons freely. This electron "sea" allows for the high electrical conductivity, malleability, and ductility of metals. Metals like copper, iron, and gold exhibit metallic bonding.',
                            overflow: TextOverflow.fade,
                            maxLines: 4,
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 228, 228, 228),
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
                                    builder: (context) =>
                                         ConversationScreen(
                                      chatRoomId: 'dfdf',
                                      userName: 'Studiesy',
                                      subject: subjects[index],
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
              })
          
    );
  }
}
