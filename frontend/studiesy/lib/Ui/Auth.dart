import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:studiesy/Authentication.dart';
import 'package:studiesy/Ui/Teacher.dart';
import 'package:studiesy/Ui/Widgets/froastedGlass.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 229, 188, 255),
                Color.fromARGB(255, 105, 23, 168)
              ]),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(30.sp),
              child: Container(
                height: 65.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(248, 249, 163, 255),
                        Color.fromARGB(255, 255, 251, 238)
                      ]),
                ),
                child: const FrostedGlassBox(
                  width: 75.0,
                  height: 90.0,
                  child: AuthCard(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: AnimatedToggleSwitch<int>.size(
            current: value,
            values: const [0, 1],
            iconOpacity: 0.2,
            indicatorSize: Size.fromWidth(40.w),
            iconBuilder: (value, size) {
              IconData data = Icons.person;
              if (value.isEven) data = Icons.login;
              return Icon(data, size: min(size.width, size.height));
            },
            borderColor: value.isEven
                ? const Color.fromARGB(255, 121, 0, 165)
                : const Color.fromARGB(255, 205, 7, 255),
            colorBuilder: (i) => i.isEven
                ? const Color.fromARGB(255, 219, 160, 255)
                : const Color.fromARGB(255, 245, 138, 255),
            onChanged: (i) => setState(() => value = i),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        AuthForm(
          value: value,
        )
      ],
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required this.value});
  // ignore: prefer_typing_uninitialized_variables
  final value;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String text = '';
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.value == 0
            ?Padding(
                padding: EdgeInsets.all(2.w),
                child: Text(
                  'Student',
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            :Padding(
                padding: EdgeInsets.all(2.0.w),
                child: Text(
                  'Teacher',
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
       widget.value == 0
       ?  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Material(
            elevation: 2,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(15.sp),
            child: TextFormField(
              controller: _email,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a Valid email'
                      : null,
              decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'E-mail',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.sp)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
        ):
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Material(
            elevation: 2,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(15.sp),
            child: TextFormField(
              controller: _email,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a Valid secret key'
                      : null,
              decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'E-mail',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.sp)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          child: Material(
            elevation: 2,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(15.sp),
            child: TextFormField(
              controller: _password,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter Min 6+ characters'
                  : null,
              obscureText: true,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.sp)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        widget.value == 0
            ? MaterialButton(
                onPressed: () {
                  AuthService().signInWithEmailAndPassword(
                      _email.text, _password.text, context);
                },
                color: const Color.fromARGB(255, 148, 30, 208),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10.sp, 20.sp),
                  ),
                ),
                height: 7.h,
                minWidth: 50.w,
                elevation: 10,
                child: Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : MaterialButton(
                onPressed: () {
                  if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                    // AuthService().registerWithEmailAndPassword(
                    //     _email.text, _password.text, context);
                    if (_email.text == 't123@vps.up' &&
                        _password.text == 'teacher123') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TeacherScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        text = 'Invalid Credentials';
                      });
                    }
                  }
                },
                color: const Color.fromARGB(255, 148, 30, 208),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10.sp, 20.sp),
                  ),
                ),
                minWidth: 50.w,
                height: 7.h,
                elevation: 10,
                child: Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.red),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Divider(
            thickness: 2,
          ),
        ),
        // SizedBox(
        //   height: 2.h,
        // ),
        // widget.value == 0
        //     ? Text(
        //         'Google Login',
        //         style: GoogleFonts.poppins(
        //           fontSize: 18.sp,
        //           color: const Color.fromARGB(255, 0, 0, 0),
        //           fontWeight: FontWeight.w700,
        //         ),
        //       )
        //     : Text(
        //         'Google Login',
        //         style: GoogleFonts.poppins(
        //           fontSize: 18.sp,
        //           color: const Color.fromARGB(255, 0, 0, 0),
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 5.w),
        //   child: MaterialButton(
        //     onPressed: () {
        //       AuthService().signInogWithGoogle(context);
        //     },
        //     color: const Color.fromARGB(255, 255, 255, 255),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0.sp)),
        //     elevation: 20,
        //     child: Center(
        //       child: Padding(
        //         padding: EdgeInsets.all(1.0.w),
        //         child: SizedBox(
        //           height: 4.h,
        //           child: Image.network(
        //             'https://img.icons8.com/fluency/48/google-logo.png',
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}