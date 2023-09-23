import 'package:flutter/material.dart';
import 'package:studiesy/Ui/Auth.dart';
import 'package:studiesy/Ui/HomeScreen.dart';
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
        decoration: const BoxDecoration(color: Color(0xFFFFCA2D)),
        child: Center(
          child: Image.network(
            'https://img.icons8.com/fluency/48/google-logo.png',
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
            builder: (context) => const NavigationPage(),
          ),
        );
      }
    });
  }
}
