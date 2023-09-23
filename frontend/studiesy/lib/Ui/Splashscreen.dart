import 'package:flutter/material.dart';
import 'package:studiesy/Ui/Auth.dart';
import 'package:studiesy/Ui/Teacher.dart';
import 'package:studiesy/Ui/navigation.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(248, 249, 163, 255),
              Color.fromARGB(255, 255, 251, 238),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/Studiesy-logos_black.png',
            width: 300,
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
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Authentication(),
          ),
        );
      }
    });
  }
}
