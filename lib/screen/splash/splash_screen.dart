import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/Images/fireworks.png"),
                ),
              ),
            ),
            Text("Festival Post Maker",style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
