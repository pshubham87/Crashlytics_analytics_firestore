import 'package:flutter/material.dart';
import 'package:track_flow/widgets/btn.dart';
import 'package:track_flow/widgets/color.dart';
import 'package:track_flow/widgets/txt_style.dart';

successDialog({
  required BuildContext context,
  required String? title,
  required String? message,
  String? img,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title!,
                    style: AppText.of(context).headingStyle1(
                      color: AppColor.of(context).black1,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: AppText.of(context).bodyStyle1(
                      color: AppColor.of(context).black1,
                      size: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: "Close",
                    onTap: () => Navigator.pop(context),
                    curve: 12,
                    height: 45,
                    width: 180,
                    icon: false,
                    iconData: Icons.arrow_forward_ios,
                    iconColor: const Color(0xffF5591F),
                    gradientBox: false,
                    color: const Color(0xffF5591F),
                    length: MediaQuery.of(context).size.width * 0.4,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
