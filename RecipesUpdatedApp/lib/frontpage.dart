import 'package:dashboard/croselbanner/route/app_pages.dart';
import 'package:dashboard/croselbanner/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class Frontpage extends StatefulWidget {
  const Frontpage({Key? key}) : super(key: key);

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: AppRoutes.home,
      themeMode: ThemeMode.system,
    );
  }
}