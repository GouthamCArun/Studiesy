import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Ui/Teacher.dart';

class TeacherDash extends StatefulWidget {
  const TeacherDash({super.key});

  @override
  State<TeacherDash> createState() => _TeacherDashState();
}

class _TeacherDashState extends State<TeacherDash> {
  // Initial Selected Value
  String dropdownvalue = 'Physics';

  // List of items in our dropdown menu
  var items = [
    'Physics',
    'Chemistry',
    'English',
    'Mathematics',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 120, 247),
      appBar: AppBar(
        title: Text(
          'Studiesy',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.sp),
              height: 7.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color.fromARGB(255, 176, 147, 255)),
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    alignment: Alignment.center,
                    child: Text(
                      items,
                      style: GoogleFonts.poppins(),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeacherScreen(
                      subject: dropdownvalue,
                    ),
                  ),
                );
              },
              child: const Text('Start Live class'),
            )
          ],
        ),
      ),
    );
  }
}
