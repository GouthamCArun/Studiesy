import 'package:flutter/material.dart';
import 'package:studiesy/Ui/Auth.dart';
import 'package:studiesy/Ui/navigation.dart';
import 'package:studiesy/Ui/teacherNavigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.loggedInSplash});
  // ignore: prefer_typing_uninitialized_variables
  final loggedInSplash;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFBE03FD),
              Color(0xFFBE03FD),
            ],
          ),
        ),
        child: Center(
          child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/studiesy.appspot.com/o/icon.png?alt=media&token=443d87d3-e6d8-42dd-ab3c-6c2dfb4cff17&_gl=1*1ecrs0v*_ga*MzE1MTYxMjk2LjE2NzkxNDI3OTE.*_ga_CW55HF8NVT*MTY5NjA1MjU1Ni42MS4xLjE2OTYwNTMwNjkuNjAuMC4w',
          ),
        ),
      ),
    );
  }

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (widget.loggedInSplash == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Authentication(),
          ),
        );
      } else if (widget.loggedInSplash == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationPage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TeacherNavigation(),
          ),
        );
      }
    });
  }
}
