// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );


    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );


    _controller.forward();


    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.blue.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: ScaleTransition(
              scale: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('.dart_tool/assets/kitchen/369692775_793293339162526_5496493608221056920_n.jpg'), // مسار شعار الشركة
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'اهلا بكم في شركة العبود',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}