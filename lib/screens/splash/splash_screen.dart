import 'package:flutter/material.dart';
import 'package:warehouse_rvp/screens/home_screen/home_screen.dart';
import 'package:warehouse_rvp/utils/app_images.dart';
import 'package:warehouse_rvp/utils/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFcececc),
      body: Center(
        child: Image.asset(
          AppImages.appIcon,
        ),
      ),
    );
  }
}
