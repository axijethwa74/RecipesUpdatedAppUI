import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';
import 'widgets/carousel_loading.dart';
import 'widgets/carousel_with_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(
        () {
          if (carouselController.isLoading.value) {
            return const Center(
              child: CarouselLoading(),
            );
          } else {
            if (carouselController.carouselItemList.isNotEmpty) {
              return CarouselWithIndicator(
                  data: carouselController.carouselItemList);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.hourglass_empty),
                    Text("Data not found!")
                  ],
                ),
              );
            }
          }
        },
      )),
    );
  }
}