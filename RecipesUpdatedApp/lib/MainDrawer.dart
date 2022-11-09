// ignore_for_file: file_names
import 'package:dashboard/Setting.dart';
import 'package:dashboard/shared.dart';
import 'package:flutter/material.dart';

import 'explorer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required }) : super(key: key);
  // ignore: non_constant_identifier_names
  Widget BuildTitle(String title, IconData icon, Function() tapHandler){
    return  ListTile(
            leading:  Icon(icon,
            size: 20,),
            title:Text(title,
             style: const TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
  
            onTap: tapHandler,
          );


  }

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child :  Column(     
        children:  [
          Container(         
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, left: 20),
            alignment: Alignment.bottomLeft,
            // color: Theme.of(context).primaryColor,
            child: buildTextTitleVariation1("Cooking Up !"),          
          ),
          
          const SizedBox(height:5,),
          BuildTitle(
            'Meal',
            Icons.restaurant,
            (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Explorer() ));
            }
          ),
          BuildTitle(
             'Setting',
            Icons.settings,
              (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const Setting(),
      ));    }
          ),

           BuildTitle(
            'Help',
            Icons.help_center,
            (){
              Navigator.of(context).pushNamed("/");
            }
          ),
        ],
      ),
    );
  }
}