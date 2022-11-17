
import 'package:get/get.dart';

import '../home/home_binding.dart';
import '../home/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
  ];
}