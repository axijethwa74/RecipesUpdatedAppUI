
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Introduction_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen()));
    }); 
    super.initState();
  }
  
  
  
  
  
  
  // // ignore: override_on_non_overriding_member
  // void iniiState(){
  //     // ignore: prefer_const_constructors
  //   Future.delayed( Duration(milliseconds: 2),(){
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Explorer()));
  //    });
  //   super.initState();
  // }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset("assets/foodies.json"),
            
            ),
        ],  
         ),
      ),
    );
  }
}