import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../config/routes/app_routes.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() async {
    Get.offAndToNamed(Routes.HOMEPAGE);
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  ImageAssets.plant5,
                  width: 150.w,
                  height: 130.w,
                )),
            FadeInUp(
              duration: const Duration(seconds: 2),
              child: Text(
                AppStrings.appName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.fontFamilyLetters,
                    fontSize: 20.sp,
                    color: AppColors.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
