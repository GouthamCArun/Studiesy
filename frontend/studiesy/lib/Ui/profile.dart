import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Ui/Auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    // Redirect to the login page or any other page after logout
    // You can use Navigator.pushReplacement or other navigation methods here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Center(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 30.sp,
                      color: const Color(0xFFBE03FD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 70.sp,
                  backgroundImage: const AssetImage(
                      'assets/man2.png'), // Use backgroundImage for AssetImage
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 60.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFBE03FD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Email: ${_user.email}',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Text(
                          'Class: 7 B',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform your logout logic here
                          // For example, you can clear user session and navigate to login screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Authentication(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                Colors.white, // Set the text color to black
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 50)),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
