import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_flow/widgets/color.dart';

class AppDecoration {
  final BuildContext context;

  AppDecoration(this.context);

  static AppDecoration of(context, {bool listen = true}) {
    return Provider.of<AppDecoration>(context, listen: listen);
  }

  InputBorder get border1 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Colors.white));

  InputBorder get border2 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.grey));

  InputBorder get border3 => UnderlineInputBorder(
      borderSide: BorderSide(color: AppColor.of(context).blue1));

  BoxDecoration get appBarDecoration => BoxDecoration(
          boxShadow: [
            const BoxShadow(
              offset: Offset(
                5.0,
                15.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: AppColor.of(context).lightGrey,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          gradient: LinearGradient(colors: [
            AppColor.of(context).lightGrey,
            AppColor.of(context).lightGrey
          ]));

  BoxDecoration get bottomDecoration => BoxDecoration(
        color: AppColor.of(context).orange1,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(3, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(55),
          topRight: Radius.circular(55),
        ),
      );

  InputBorder border4({Color? color, double? curve}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(curve ?? 4.0),
        borderSide: BorderSide(color: color ?? AppColor.of(context).blue1));
  }

  BoxDecoration outlineDecoration({Color? color, double? curve}) {
    return BoxDecoration(
      border:
          Border.all(color: color ?? AppColor.of(context).primary, width: 1),
      borderRadius: BorderRadius.circular(curve ?? 5),
    );
  }

  BoxDecoration filledDecoration({int? index, double? curve, Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.of(context).primary,
      borderRadius: BorderRadius.circular(curve ?? 5),
    );
  }

  BoxDecoration filledDeco({int? index, double? curve, Color? color}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromRGBO(37, 115, 192, 1),
          Color.fromRGBO(23, 74, 124, 1),
        ],
      ),
      borderRadius: BorderRadius.circular(curve ?? 5),
    );
  }
}
