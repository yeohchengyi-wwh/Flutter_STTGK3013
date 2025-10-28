import 'package:flutter/material.dart';
import 'package:lab1_303844/homepage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(!mounted)return;
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/laundryIcon.png',scale: 4),
            SizedBox(height: 20),
            Text('Laundry Load Planner',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            SizedBox(height: 20),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}