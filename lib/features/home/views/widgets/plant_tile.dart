import 'package:animate_do/animate_do.dart';
import 'package:animated_plant_ui/core/utils/app_colors.dart';
import 'package:animated_plant_ui/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlantTileWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  const PlantTileWidget({
    Key? key,
    required this.plantName,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<PlantTileWidget> createState() => _PlantTileWidgetState();
}

class _PlantTileWidgetState extends State<PlantTileWidget> {
  double _boxWidth = 400;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _boxWidth = 350;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 150,
                width: _boxWidth,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: AppColors.primary),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 85, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 130.w,
                          child: Text(
                            widget.plantName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 25.sp,
                                fontFamily: AppStrings.fontFamily,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            const IconWidget(icon: Icons.water_drop_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            const IconWidget(icon: Icons.thermostat_auto),
                            const SizedBox(
                              width: 10,
                            ),
                            const IconWidget(icon: Icons.sunny),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
            Positioned(
              left: 5,
              child: Container(
                height: 150,
                width: 120,
                child: ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Image.asset(
                      widget.imgUrl,
                      // width: 60,
                      // height: 60,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.7)),
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white.withOpacity(.7),
      ),
    );
  }
}
