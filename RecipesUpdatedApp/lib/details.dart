// ignore: unused_import
import 'package:dashboard/contants.dart';
import 'package:dashboard/data.dart';
import 'package:dashboard/shared.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {

  final Recipe recipe;

  const Details({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },

          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ), 
        actions: const [
          Padding(padding: EdgeInsets.only(right:16),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),          
          ),      
        ],      
               
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation1(recipe.title),
                  buildTextSubTitleVariation1(recipe.description),
                   
                ],

              ),
            ),
            const SizedBox(
              height: 16,
            ),

            Container(
              height: 310,
              padding: const EdgeInsets.only(left: 16),
              child: Stack(
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      buildTextTitleVariation2("Nutritious", false),

                       const SizedBox(
                          height: 16,),

                       buildNutrition(recipe.calories, "calories", "Kcal"),

                        const SizedBox(
                          height: 16,),

                         buildNutrition(recipe.carbo, "Carbo", "g"),

                        const SizedBox(
                          height: 16,),

                         buildNutrition(recipe.protein, "Protein", "g"),

                        

                           


                     ],
                  ),

                  Positioned(
                    right: -80,
                    child: Hero(tag: recipe.image,
                     child: Container(
                      height: 310,
                      width: 310,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(recipe.image),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                     )),
                  ),
                  
                ],
              ),

            ),

             Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextSubTitleVariation1("2 Cup pecans divided"),
                  buildTextSubTitleVariation1("1 table Spoon unsalted Butter, melted"),
                  buildTextSubTitleVariation1("1/4 tea Spoon Koshar Salt, plus more"),
                  buildTextSubTitleVariation1("3 table Spoon fresh lemon juice"),
                  buildTextSubTitleVariation1("2 table Spoon Olive oil"),
                  buildTextSubTitleVariation1("1/2 tea Spoon honey"),

                  const SizedBox(
                    height: 16,
                  ),

                  buildTextTitleVariation2("Recipe Preparation", false),

                  buildTextSubTitleVariation1("STEP 1"),
                  buildTextSubTitleVariation1("In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),

                  buildTextSubTitleVariation1("STEP 2"),
                  buildTextSubTitleVariation1("In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),

                  buildTextSubTitleVariation1("STEP 3"),
                  buildTextSubTitleVariation1("Add the spices with the tomato purée, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),         

                ],
              ),
              ),
                    ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          
        },
        backgroundColor: KPrimaryColor,
        icon: const Icon(Icons.play_circle_fill,
        color: Colors.white,
        size: 32,
        ),
        label: const Text(
          "Watch vedio",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
         ),
    ); 
  }


  Widget buildNutrition(int value, String title, String subTitle){
    return Container(
      height: 60,
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [KBoxShadow]
      ),
      child: Row(
        children: [
           Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [KBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           ),
        
        const SizedBox(
          width: 20,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

               Text(
              subTitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),


          ],
        ),
        
        ],
      ),

    );
  }
}
