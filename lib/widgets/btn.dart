import 'package:flutter/material.dart';
import 'package:track_flow/widgets/color.dart';
import 'package:track_flow/widgets/decoration.dart';
import 'package:track_flow/widgets/loader.dart';
import 'package:track_flow/widgets/txt_style.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final double? length;
  final TextStyle? titleStyle;
  final bool loading;
  final bool icon;
  final bool gradientBox;
  final int? shadowIndex;
  final String? logo;
  final double? curve;
  final Color? color;
  final Color? loaderColor;
  final Color? iconColor;
  final IconData? iconData;
  final double? iconSize;
  final FocusNode? focus;
  final Color? textColor;
  final bool? hasBorder;
  final FontWeight? fontWeight;
  final double? size;

  const CustomButton({
    this.logo,
    this.onTap,
    required this.title,
    this.decoration,
    this.height,
    this.length,
    this.titleStyle,
    this.loading = false,
    this.gradientBox = false,
    this.shadowIndex,
    this.color,
    this.loaderColor,
    this.curve,
    this.focus,
    this.iconData,
    this.iconSize,
    this.icon = false,
    this.iconColor,
    Key? key,
    this.textColor,
    this.hasBorder = false,
    this.fontWeight,
    this.size,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focus,
      onTap: widget.onTap,
      child: Container(
          height: widget.height ?? 90,
          width: widget.width,
          decoration: boxDecoration(),
          child: widget.loading
              ? spinKit(color: Colors.blue, context: context)
              : widget.logo == null && widget.icon == false
                  ? Center(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppText.of(context)
                            .bodyStyle1(
                                size: widget.size ?? 18,
                                color: widget.textColor ?? Colors.white)
                            .copyWith(
                              fontWeight: widget.fontWeight ?? FontWeight.w700,
                            ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.logo != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image(
                                image: AssetImage(widget.logo!),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                widget.title,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: widget.titleStyle ??
                                    AppText.of(context)
                                        .bodyStyle1(
                                            size: widget.size ?? 16,
                                            color: widget.textColor ??
                                                Colors.white)
                                        .copyWith(
                                          fontWeight: widget.fontWeight ??
                                              FontWeight.w700,
                                        ),
                              ),
                            ),
                          ),
                          if (widget.icon == true)
                            Icon(
                              widget.iconData,
                              size: widget.iconSize ?? 14,
                              color: widget.iconColor,
                            ),
                        ],
                      ),
                    )),
    );
  }

  BoxDecoration boxDecoration() {
    if (widget.onTap == null || widget.loading) {
      return AppDecoration.of(context).filledDecoration(
          color: AppColor.of(context).grey, curve: widget.curve);
    } else if (widget.gradientBox == true) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.curve ?? 50),
      );
    } else if (widget.decoration != null) {
      return widget.decoration!;
    } else {
      return AppDecoration.of(context)
          .filledDecoration(curve: widget.curve, color: widget.color);
    }
  }
}
