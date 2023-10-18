import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor {
  final BuildContext context;

  AppColor(this.context);

  static AppColor of(context, {bool listen = true}) {
    return Provider.of<AppColor>(context, listen: listen);
  }

  Color get primary => const Color(0xFF174A7C);
  Color get secondary => const Color(0xFF434343);
  Color get secondary1 => const Color(0xffF5591F);

  //splash screen gradiant colors
  Color get white => const Color(0xFFFFFEFE);
  Color get white1 => const Color(0xFFF3FDFF);

  // on board screen
  Color get purple => const Color(0xFF8034FF);
  Color get pink => const Color(0xFFF7A8CB);

  Color get secondaryGrey => const Color(0xFF58595B);
  Color get secBlue => const Color(0xFF005596);
  Color get secLightBlue => const Color(0xFF7ED0E0);
  Color get secRed => const Color(0xFF6F02DA);
  Color get secRed1 => const Color(0xFF6D6E71);
  Color get secGreen => const Color(0xFF4EC1B6);
  Color get secGreen2 => const Color(0xFFCDFFFA);

  Color get black1 => const Color(0xFF252628);
  Color get black2 => const Color(0xFF000000);
  Color get redBG => const Color(0xFFd83030);
  Color get lightRedBG => const Color(0xFFf7f7f7);
  Color get greyBG => const Color(0xFFEDEAEA);
  Color get txtColor => const Color(0xFF032e42);
  Color get txtColor1 => const Color(0xFF404040);
  Color get txtColor2 => const Color(0xFF434343);
  Color get txtColor3 => const Color(0xFF333333);
  Color get txtBodyColor => const Color(0xFF333333);
  Color get txtHeadColor => const Color(0xFF1c1c1c);
  Color get bluricon => const Color(0xFF174A7C);

  Color get googleButton => const Color(0xFF4285F4);
  Color get dateback => const Color(0xFF0088BB);

  Color get grey => const Color(0xFFc9d0d6);
  Color get grey2 => const Color(0xFF9D9D9D);
  Color get grey3 => const Color(0xFFD7D6D6);
  Color get grey4 => const Color(0xFFDEDCDC);
  Color get grey6 => const Color(0xFFEBEBEB);
  Color get darkGrey => const Color(0xFF4f85b8);
  Color get lightGrey => const Color(0xFF93989F);

  Color get black3 => const Color(0xFF333333);
  Color get black4 => const Color(0xFF404040);

  Color get navyBlue => const Color(0xff191c46);
  Color get blue => const Color(0xff1c274a);
  Color get fbBlue => const Color(0xff1b3687);
  Color get red => const Color(0xFFeb5449);

  Color get purple1 => const Color(0xff7f4798);
  Color get purple2 => const Color(0xffd38ce1);
  Color get purple4 => const Color(0xff7C60D5);

  Color get orange1 => const Color(0xfffeb375);
  Color get orange2 => const Color(0xffff7500);

// beach towels
  Color get red1 => const Color(0xfffe4a49);
  Color get red2 => const Color(0xffD24343);
  Color get red3 => const Color(0xff901235);
  Color get blue1 => const Color(0xff2ab7ca);
  Color get yellow1 => const Color(0xfffed766);
  Color get grey1 => const Color(0xffe6e6ea);
  Color get grey5 => const Color(0xffE5E5E5);
}
