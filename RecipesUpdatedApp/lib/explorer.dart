import 'package:dashboard/MainDrawer.dart';
import 'package:dashboard/contants.dart';
import 'package:dashboard/data.dart';
import 'package:dashboard/details.dart';
// ignore: unused_import
import 'package:dashboard/frontpage.dart';
import 'package:dashboard/shared.dart';
import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  State<Explorer> createState() => _ExplorerState();
}
    List<bool> optionselected =[true,false,true];

class _ExplorerState extends State<Explorer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        elevation: 0,      
        iconTheme: const IconThemeData(color: Colors.black),
        // leading: const Icon(
        //   Icons.sort,
        //   color: Colors.black,
        // ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
 
   drawer: const MainDrawer(),
        body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation1("Springy Foodies"),
                  buildTextSubTitleVariation1("Healthy & nutritious Food Recipes"),
                  
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      option('vegetable', 'assets/icons/salad.png',0),
                     const SizedBox(width: 8,),
                      option('rice', 'assets/icons/rice.png',1),
                     const SizedBox(width: 8,),
                      option('Fruit', 'assets/icons/fruit.png',2),

                    ],
                  )

                ],

              ),
  
               ),

                // ignore: sized_box_for_whitespace
                Container(
                  height: 280,
                  width: 350,
                  child: const Frontpage(),
                 ),

              // ignore: sized_box_for_whitespace
              Container(
                height: 350,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildRecipes(),
                ),
              ),

              
                  
                   const SizedBox(
                     height: 16),

                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    buildTextTitleVariation2("Popular", false),

                    const SizedBox(
                width: 8,
               ),
                    buildTextTitleVariation2("Food", true),

                  ],

                ),
               ),
               // ignore: sized_box_for_whitespace
               Container(
                height: 190,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: buildPopulars(),
                ),
               ),
          ],


        ),

      ),
    );
  }

  Widget option(String text, String image, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          optionselected[index] = !optionselected[index];
        });
      },
      child: Container(
        height: 35,
        decoration:  BoxDecoration(
          color: optionselected[index] ? KPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [KBoxShadow],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children:  [
    
            SizedBox(
              height: 32,
              width: 28,
              child: Image.asset(
                image,
                color: optionselected[index] ? Colors.white : Colors.black,
              ),
            ),
    
             const SizedBox(width: 8),
    
             Text(
              text,
              style: TextStyle(
                color: optionselected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                            ),
             )
          ],
        ),
      ),
    );

  }

 List<Widget> buildRecipes(){
  // ignore: unused_local_variable
  List<Widget> list =[];
  for(var i = 0; i < getRecipes().length; i++){
    list.add(buildRecipe(getRecipes()[i],i));
    
  }
  return list; 

 }

 Widget buildRecipe(Recipe recipe, int index){
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> Details(recipe:recipe),
      ));
    },
    child: Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [KBoxShadow],
      ),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
      padding: const EdgeInsets.all(16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
  
  
          Expanded
          (
            child: Hero(
              tag: recipe.image,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe.image),
                    fit:BoxFit.contain
                  )
                ),
              ),
  
            ),
            
             ),
  
  
             const SizedBox(
              height: 8
              ),
              buildRecipeTitle(recipe.title),
  
              buildTextSubTitleVariation2(recipe.description),
  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCalories("${recipe.calories}Kcal"),
  
                  const Icon(
                    Icons.favorite_border,
                  ),
                     ],
              ),
        ],
  
      ),
    ),
  );




 }

 List<Widget> buildPopulars(){
  // ignore: unused_local_variable
  List<Widget> list =[];
  for(var i = 0; i < getRecipes().length; i++){
    list.add(buildPopular(getRecipes()[i]));
    
  }
  return list; 
 }

 Widget buildPopular(Recipe recipe){
  return Container(
    margin: const EdgeInsets.all(16),
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      boxShadow: [KBoxShadow]
    ),
    child: Row(
    children: [
      Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.image),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),

       Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              buildRecipeTitle(recipe.title),
              buildRecipeSubTitle(recipe.description),

               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories("${recipe.calories}Kcal"),

                IconButton(onPressed: (){
                     
                }, icon: const Icon(
                  Icons.favorite_border,
                ),)
                   ],
            ),

            ],
          ),
        ),
      ),
    ],
    ),
  );
 }


}