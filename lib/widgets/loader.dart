import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'color.dart';

spinKit({Color? color, required BuildContext context}) => SpinKitThreeBounce(
      color: color ?? AppColor.of(context).primary,
      size: 20.0,
    );

fadingCircle({Color? color, required BuildContext context}) => Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Center(
              //     child: CustomLottie(
              //   asset: AppImg.of(context).loader,
                // height: screenSize(context).height * 0.25,
              // )
              ),
        ],
      ),
    );

loader(
        {required BuildContext context,
        double? height,
        bool showHeight = true}) =>
    const Center(
        // child: NoContent(
        //   title: '',
        //   description: '',
        //   animHeight: height,
        //   showHeight: showHeight,
        //   lottieAsset: AppImg.of(context).loader,
        // ),
        );
