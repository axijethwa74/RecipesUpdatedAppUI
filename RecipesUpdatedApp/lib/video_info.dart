// ignore_for_file: prefer_is_empty

import 'dart:convert';
import 'package:dashboard/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import "colors.dart" as color;





class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoInfo=[ ];
  // ignore: unused_field
  bool _playArea= false;
  // ignore: unused_field
  bool _isPlaying= false;

  // ignore: unused_field
  bool _disposed= false;

  // ignore: unused_field
  int _isPlayingIndex = -1;
  // ignore: unused_field
 VideoPlayerController? _controller;
  

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo= json.decode(value);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
    //_onTapVideo(-1);
  }

  @override
  void dispose(){
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        body: Container(
          decoration: _playArea==false ? BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.KPrimaryColor,
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
          ): BoxDecoration(
            color: color.AppColor.KPrimaryColor,
          ),
      child: Column(
        children: [
          _playArea==false ?
           Container(
            padding: const EdgeInsets.only(top:70, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios,
                        color: Colors.black,
                         ),
                    ),
                    Expanded(child: Container()),
                    const Icon(Icons.info_outline,
                        color:Colors.black),
                  ],
                ),
                const SizedBox(height: 25,),
                buildRecipeTitle4("Enjoy your Recipes"),
                Row(
                  children: [
                   Icon(Icons.play_circle,
                          size: 50,
                              color:color.AppColor.secondPageIconColor,),
                          const SizedBox(width: 3,),
                   buildRecipeTitle3("Watch Now"),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(                
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            color.AppColor.secondPageContainerGradient2ndColor,
                            color.AppColor.secondPageContainerGradient2ndColor
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                      ),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer,
                          size: 20,
                              color:color.AppColor.secondPageIconColor,),
                          const SizedBox(width: 5,),
                          Text(
                            "68 min",
                            style: TextStyle(
                              fontSize: 14,
                              color:color.AppColor.secondPageIconColor
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient2ndColor,
                              color.AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.food_bank_rounded,
                            size: 20,
                            color:color.AppColor.secondPageIconColor,),
                          const SizedBox(width: 5,),
                          Text(
                            "Food Bloggers, Central",
                            style: TextStyle(
                                fontSize: 14,
                                color:color.AppColor.secondPageIconColor
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ],
            )
          ) 
            // ignore: avoid_unnecessary_containers
            : Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap:(){
                        Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context)=> const VideoInfo(),
                       ));
                      },
                        child: const Icon(Icons.arrow_back_ios,
                    
                        
                        ),
                      ),
                      Expanded(child: Container()),
                      const Icon(Icons.info_outline,
                      
                      
                      ),
                      
                    ],
                  ),
                ),
                _playView(context),
                _controllView(context),
              ],
            ),
          ),
          Expanded(child: Container(
            decoration: const BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70)
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const SizedBox(width: 30,),
                    Text(
                      "All Playlist ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:color.AppColor.circuitsColor
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(Icons.loop, size: 30,color:color.AppColor.loopColor),
                        const SizedBox(width: 10,),
                        Text(
                          "5 videos",
                          style: TextStyle(
                            fontSize: 15,
                            color:color.AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: _listView()
                    ),
              
              ],
            ),
          ))
        ],
      ),
    ));


  }

Widget _playView(BuildContext context){
  // ignore: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
  var _onUpdateControllerTime;

   // ignore: unused_element, no_leading_underscores_for_local_identifiers
   void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime = 0;
    // ignore: unused_local_variable
    final now = DateTime.now().minute;

    if(_onUpdateControllerTime> now){
      return;
    }
    // _onUpdateControllerTime=now+5000;
    // ignore: unused_local_variable
    final controller =_controller;
    // ignore: unnecessary_null_comparison
    if(controller == null){
      debugPrint("Controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controller is not initialized");
      return;
    }
    
   
    




  }
  final controller= _controller;
  // ignore: unnecessary_null_comparison
  if( controller!=null && controller.value.isInitialized){
   
    return AspectRatio(
      aspectRatio: 16/9,
      child: VideoPlayer(controller),
    );
  }else{
    return const AspectRatio(
      aspectRatio: 16/9,
      child: Center(child: Text("Video is loading...",
      style: TextStyle(
      fontSize: 20,
      color: Colors.black),
      )));

  }
}
String convertTwo(int value){
  return value < 10 ? "0$value" : "$value";
}


Widget _controllView(BuildContext context){
  // ignore: unused_local_variable
  final onMute= (_controller?.value.volume??0)>0; 
 
  return Center(
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 5, right: 10),
      color: color.AppColor.KPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,
              vertical: 8),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),

                    ),
                  ]
                ),
                child: Icon(
                  onMute?Icons.volume_up:Icons.volume_off,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: (){
              if(onMute){
                _controller?.setVolume(0);
              }
              else{
                _controller?.setVolume(1.0);
              }
              setState(() {
                
              });

            },
          ),
    
           IconButton(onPressed: ()async{
            // ignore: unused_local_variable
            final index = _isPlayingIndex-1;

            if(index>=0 && videoInfo.length>=0) {
              _onTapVideo(index);
            }else{
              Get.snackbar("Video List", "",
              snackPosition: SnackPosition.BOTTOM,
              icon: const Icon(Icons.face,
              size: 30,
              color: Colors.black,),
              backgroundColor: color.AppColor.KPrimaryColor,
              colorText: Colors.black,
              messageText: const Text(
                "No video is play",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              
              );
            }
           },
          icon: const Icon(Icons.fast_rewind,
          size: 36,
          color: Colors.black,
          ),
          ),
    
           IconButton(onPressed: ()async{
            if(_isPlaying){
              setState(() {
                _isPlaying=false;
              });
              _controller?.pause();
            }else{
              setState(() {
                _isPlaying=true;
              });
              _controller?.play();
            }
         },
          icon: Icon(_isPlaying?Icons.pause:Icons.play_arrow,
          size: 36,
          color: Colors.black,
          ),
          ),
    
           IconButton(onPressed: ()async{
            final index = _isPlayingIndex+1; 
            if(index<=videoInfo.length-1){
               _onTapVideo(index);
            }else{
              Get.snackbar("Video List", "",
              snackPosition: SnackPosition.BOTTOM,
              icon: const Icon(Icons.face,
              size: 30,
              color: Colors.black,),
              backgroundColor: color.AppColor.KPrimaryColor,
              colorText: Colors.black,
              messageText: const Text(
                "No more video in the List",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              
              );
            }

           },
          icon: const Icon(Icons.fast_forward,
          size: 36,
          color: Colors.black,
          ),
          ),
       
    
        ],
      ),
    ),
  );
}

_onTapVideo(int index)async{
  // ignore: unused_local_variable
  final controller  = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
  // ignore: unused_local_variable
  final old =_controller;
  _controller=controller;
  // ignore: unnecessary_null_comparison
  if(old!=null){
    old.removeListener(_onControllerUpdate);
    old.pause();
  }
  setState(() {

  
  });
   // ignore: avoid_single_cascade_in_expression_statements
   controller..initialize().then((_) {
       old?.dispose();
      _isPlayingIndex=index;
      controller.addListener(_onControllerUpdate);
      _controller?.play();
      setState(() {
        
      });
    });
  }
  // ignore: unused_field, prefer_typing_uninitialized_variables
  var _onUpdateControllerTime;

  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime = 0;
    // ignore: unused_local_variable
    final now = DateTime.now().microsecondsSinceEpoch;

    if(_onUpdateControllerTime> now){
      return;
    }
    _onUpdateControllerTime=now+500;
    // ignore: unused_local_variable
    final controller =_controller;
    // ignore: unnecessary_null_comparison
    if(controller == null){
      debugPrint("Controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controller is not initialized");
      return;
    }
    // ignore: unused_local_variable
    final playing=controller.value.isPlaying;
    _isPlaying = playing;
    




  }


// ignore: unused_element
_listView(){
  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    itemCount:videoInfo.length ,
                    itemBuilder: ((context,int index){
                      return GestureDetector(
                        onTap: (){
                          debugPrint(index.toString());
                          _onTapVideo(index);
                          setState(() {
                            if(_playArea== false){
                          _playArea = true;
                            }                            
                          });
                        },
                      child: _BuildCard(index),
                      );
                    }),
                    );
}

// ignore: unused_element, non_constant_identifier_names
_BuildCard(int index){
    return Container(
                        height: 135 ,
                        color: Colors.white,
                        width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                               decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      videoInfo[index]["thumbnail"]
                                      ),
                                      fit: BoxFit.cover),  

                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    videoInfo[index]["title"],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,  
                                      ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      videoInfo[index]["time"],
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                           
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFeaeefc),
                                  borderRadius: BorderRadius.circular(10),
                                  
                                ),
                                child: const Center(
                                  child: Text(
                                    "15s rest", style: TextStyle(
                                      color:Color(0xFF839fed) , 
                                    ),
                                  ),
                                ),

                              ),
                              const SizedBox(width: 5,),
                            Row(
                              children: [
                                for(int i=0; i<=50; i++)
                               i.isEven? Container(
                                  width: 3,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: const Color(0xFF839fed),
                                  ),
                                ): Container(
                                  width: 3,
                                  height: 1,
                                  color: Colors.white,
                                  
                                ),
                              ],
                            ),
                            
                            ],
                          ),
                        
                        ],
                      ),
                      );

}
}
