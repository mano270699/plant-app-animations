import 'package:animate_do/animate_do.dart';
import 'package:animated_plant_ui/core/utils/app_strings.dart';
import 'package:animated_plant_ui/features/home/views/widgets/number_widget.dart';
import 'package:animated_plant_ui/features/home/views/widgets/plant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: controller.boxHeight.value,
              width: double.infinity,
              // color: Colors.amber,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: controller.topPickHight.value,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            // Color.fromARGB(255, 37, 110, 39),
                            AppColors.primary.withOpacity(1),
                            AppColors.primary.withOpacity(1),
                          ]),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(
                          60,
                        ),
                      ),
                    ),
                    child: Stack(children: [
                      // * app bar
                      Padding(
                        padding:
                            EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Florest".toUpperCase(),
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20.sp,
                                  letterSpacing: 5,
                                  fontFamily: AppStrings.fontFamilyLetters,
                                  fontWeight: FontWeight.w800),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(.3)),
                                  child: const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      // * top picks
                      Positioned(
                        bottom: 30,
                        left: 10,
                        child: Text(
                          "Top\nPicks",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 30.sp,
                              letterSpacing: 10,
                              fontFamily: AppStrings.fontFamilyLetters,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // * plant image
                      Positioned(
                        right: 20,
                        bottom: 50,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          height: controller.imageSize.value,
                          width: controller.imageSize.value,
                          child: Image.asset("assets/plant2.png"),
                        ),
                      )
                    ]),
                  ),
                  Positioned(
                    bottom: 0,
                    // left: 20,
                    child: Row(
                      children: [
                        AnimatedBuilder(
                            animation: controller.animationController1,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                    10 * controller.animationController1.value,
                                    0),
                                child: const NumberWidget(
                                  color: Colors.black,
                                  number: 23,
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: controller.animationController2,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                    controller.secDot.value *
                                        controller.animationController2.value,
                                    0),
                                child: const NumberWidget(
                                  color: Colors.grey,
                                  number: 10,
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: controller.animationController3,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                    200 * controller.animationController3.value,
                                    0),
                                child: const NumberWidget(
                                  color: Colors.grey,
                                  number: 8,
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: controller.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedItem.value = index;
                        },
                        child: Obx(
                          (() => AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 60,
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    controller.categoryList[index],
                                    style: TextStyle(
                                        color: controller.selectedItem.value ==
                                                index
                                            ? AppColors.blackColor
                                            : AppColors.whiteColor,
                                        fontSize: 18.sp,
                                        fontFamily:
                                            AppStrings.fontFamilyLetters,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    );
                  }))),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: ListView(
            controller: controller.scrollController,
            padding: EdgeInsets.zero,
            children: [
              FadeInRight(
                child: PlantTileWidget(
                    plantName: "Maku rela Vera",
                    imgUrl: controller.imagesListTile[1]),
              ),
              FadeInLeft(
                child: PlantTileWidget(
                    plantName: "Maku rela Vera",
                    imgUrl: controller.imagesListTile[2]),
              ),
              FadeInUp(
                child: PlantTileWidget(
                    plantName: "Maku rela Vera",
                    imgUrl: controller.imagesListTile[3]),
              ),
              FadeInDown(
                child: PlantTileWidget(
                    plantName: "Maku rela Vera",
                    imgUrl: controller.imagesListTile[4]),
              ),
              FadeInRight(
                child: PlantTileWidget(
                    plantName: "Maku rela Vera",
                    imgUrl: controller.imagesListTile[5]),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
