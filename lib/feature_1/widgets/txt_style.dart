// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppText {
  final BuildContext context;

  AppText(this.context);

  static AppText of(context, {bool listen = true}) {
    return Provider.of<AppText>(context, listen: listen);
  }

  TextStyle headingStyle1({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle headingStyle2({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle headingStyle3({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle bodyStyle1({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle bodyStyle2({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle subStyle1({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }

  TextStyle subStyle2({
    double? size,
    Color? color,
    String? fontfamily,
  }) {
    return Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontSize: size, color: color, fontFamily: fontfamily);
  }
}
