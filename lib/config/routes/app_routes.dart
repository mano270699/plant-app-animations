import 'package:animated_plant_ui/features/home/binding/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_strings.dart';

import '../../features/home/views/home_page.dart';
import '../../features/splash/splash.dart';

class Routes {
  static const String INITIAL = '/';
  static const String HOMEPAGE = '/home-page';
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
