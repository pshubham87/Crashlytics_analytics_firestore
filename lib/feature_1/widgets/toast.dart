import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/widgets/color.dart';
import 'package:track_flow/feature_1/widgets/txt_style.dart';

enum ToastLevel { error, success, warning, info, delete }

// bottom toast
showBottomMsg(
    {required BuildContext context,
    required String msg,
    Color? textColor,
    ToastLevel level = ToastLevel.error}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return ListTile(
        dense: true,
        minLeadingWidth: 0,
        minVerticalPadding: 18,
        horizontalTitleGap: 5,
        leading: Icon(
          level == ToastLevel.error
              ? Icons.error
              : level == ToastLevel.warning
                  ? Icons.warning
                  : level == ToastLevel.delete
                      ? Icons.delete
                      : Icons.info,
          color: textColor ??
              ((level == ToastLevel.error ||
                      level == ToastLevel.warning ||
                      level == ToastLevel.delete)
                  ? AppColor.of(context).red
                  : AppColor.of(context).primary),
          size: 20,
        ),
        title: Text(
          msg,
          textAlign: TextAlign.center,
          style: AppText.of(context).headingStyle2(
              size: 20, color: textColor ?? AppColor.of(context).red),
        ),
      );
    },
  );
}

// void permissionDialog(
//     {required BuildContext context,
//     required String title,
//     required String body}) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//             title: Text(title,
//                 style: AppText.of(context)
//                     .headingStyle1(size: 17, color: Colors.black)),
//             content: Text(
//               body,
//               style:
//                   AppText.of(context).bodyStyle1(size: 15, color: Colors.black),
//             ),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 child: const Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   PhotoManager.openSetting();
//                 },
//               )
//             ],
//           ));
// }
