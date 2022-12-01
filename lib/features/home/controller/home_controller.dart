import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/assets_manager.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationControllertile1;
  late AnimationController animationControllertile2;
  void scrollListner() {
    if (scrollController.offset >= 100) {
      print("scroll started");
      // _secDot = 10;
      boxHeight.value = 350.0;
      topPickHight.value = 340.0;
      imageSize.value = 200.0;
      // _animationController2.repeat();

    }
    if (scrollController.offset <= 10) {
      Future.delayed(const Duration(milliseconds: 200), () {
        print("reached top");
        boxHeight.value = 460.0;
        topPickHight.value = 450.0;
        imageSize.value = 250.0;
      });
    }
  }

  var boxHeight = 460.0.obs;
  var imageSize = 230.0.obs;
  var topPickHight = 450.0.obs;
  var secDot = 70.0.obs;
  List<String> categoryList = ["All", "Outdoor", "Indoor", "Sunlight"];

  List<String> imagesListTile = [
    ImageAssets.plant1,
    ImageAssets.plant5,
    ImageAssets.plant4,
    ImageAssets.plant2,
    ImageAssets.plant3,
    ImageAssets.plant5,
    ImageAssets.plant4,
  ];
  var selectedItem = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    imagesListTile.shuffle();

    scrollController = ScrollController();
    scrollController.addListener(scrollListner);

    animationController1 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {});
    Future.delayed(const Duration(milliseconds: 500), () {
      animationController1.forward();
    });
    animationController2 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {});
    Future.delayed(const Duration(seconds: 1), () {
      animationController2.forward();
    });
    animationController3 = AnimationController(
        //
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {});
    Future.delayed(const Duration(seconds: 1), () {
      animationController3.forward();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    animationControllertile1.dispose();
    animationControllertile2.dispose();
  }
}
