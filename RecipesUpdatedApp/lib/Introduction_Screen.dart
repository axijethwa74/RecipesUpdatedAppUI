import 'package:dashboard/contants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'explorer.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
        // ignore: deprecated_member_use
       
      body: IntroductionScreen(
        
        pages: [
       PageViewModel(     
           title: "Welcome ",
           body: "To Recipes .. ", 
           image: Center(child: buildImage("images/coo.png"),),
           decoration: const PageDecoration(
           bodyFlex: 3,
           imageFlex: 6,
          titlePadding: EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 10.0),
           titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50,fontWeight: FontWeight.w700,fontFamily: 'Raleway-Bold'),
           bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 50.0,fontFamily: "Raleway-Bold"),
            ),
    ),
    
       PageViewModel(     
           title: "Hey Chiefs,",
           body: "What do you want \n to cook Today ?", 
           image: Center(child: buildImage("images/sec.png"),),
           decoration: const PageDecoration(
           bodyFlex: 3,
           imageFlex: 6,
           titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 10.0),
           bodyPadding: EdgeInsets.fromLTRB(50.0, 15.0, 0.0, 10.0),
           titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 45,fontWeight: FontWeight.w700),
           bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0,),
            ),
    ),
    
     PageViewModel(     
           title: "Enjoy your",
           body: "Cooking !", 
           image: Center(child: buildImage("images/third.png"),),
    
           decoration: const PageDecoration(
           bodyFlex: 3,
           imageFlex: 6,
           titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 10.0),
           bodyPadding: EdgeInsets.fromLTRB(50.0, 5.0, 0.0, 10.0),
           titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 55,fontWeight: FontWeight.w700,fontFamily: 'RobotoCondensed-Italic'),
           bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 50.0,fontFamily: "Raleway-Regular"),
            
          ),
    ),
    
     
    ],
      done: const Text("Done", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:20)),
      onDone: () => goToHome(context),
      // showNextButton: false,
      
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(color: Colors.black,fontSize:20,fontFamily: "Raleway-Bold"),),
      onSkip: ()=> goToHome(context),
      next: const Icon(Icons.arrow_forward_rounded, 
      color: Colors.black,),
      dotsDecorator: getDotDecorator(), 
      ),
    ),
    );
    
    void goToHome(context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_)=>  const Explorer()),
    );

     Widget buildImage(String path) =>
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
  
          children: [            
            // ignore: avoid_unnecessary_containers
            Container(   
                child: Center(child: Image.asset(path, width: 2500,
                )),
             
            ),
          ],
        ),
      );
      
        getDotDecorator() =>  DotsDecorator(
          color: const Color(0xFFBDBDBD),
          activeColor: KPrimaryColor,
          size: const Size(10, 10),
          activeSize: const Size(22, 10),
          activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),                            
          ),

        );
      
      

  
  
}