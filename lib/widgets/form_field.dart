import 'package:flutter/material.dart';
import 'package:track_flow/widgets/color.dart';
import 'package:track_flow/widgets/decoration.dart';
import 'package:track_flow/widgets/txt_style.dart';

class CustomFormField extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool readOnly;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscure;
  final bool mandatory;
  final int? maxLine;
  final int? minLine;
  final Color? fillColor;
  final Color? labelColor;
  final Color? titleColor;
  final FocusNode? focus;
  final String? hint;
  final String? labelTxt;
  final String? initValue;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? counter;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validatorFn;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onFiledSubmitted;
  final Function()? onEditDone;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final int? maxLength;
  final String? text;

  const CustomFormField(
      {Key? key,
      this.label,
      this.labelStyle,
      this.hintStyle,
      this.readOnly = false,
      this.labelPadding,
      this.obscure = false,
      this.mandatory = false,
      this.maxLine,
      this.minLine,
      this.fillColor,
      this.labelColor,
      this.titleColor,
      this.focus,
      this.hint,
      this.labelTxt,
      this.initValue,
      this.prefix,
      this.suffix,
      this.counter,
      this.textInputAction,
      this.controller,
      this.inputType,
      this.validatorFn,
      this.onChanged,
      this.onTap,
      this.onFiledSubmitted,
      this.onEditDone,
      this.maxLength,
      this.border,
      this.enabledBorder,
      this.text,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: labelPadding ?? const EdgeInsets.only(left: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$label',
                  style: labelStyle ??
                      AppText.of(context).headingStyle1(
                          size: 14,
                          color:
                              labelColor ?? AppColor.of(context).txtHeadColor),
                ),
                if (mandatory)
                  Text(
                    '*',
                    style: AppText.of(context).headingStyle1(
                        size: 17, color: AppColor.of(context).red),
                  ),
              ],
            ),
          ),
        TextFormField(
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          maxLength: maxLength,
          maxLines: maxLine ?? 1,
          minLines: minLine ?? 1,
          readOnly: readOnly,
          autofocus: false,
          focusNode: focus,
          controller: controller,
          initialValue: initValue,
          obscureText: obscure,
          keyboardAppearance: Brightness.dark,
          textInputAction: textInputAction ?? TextInputAction.next,
          style: AppText.of(context)
              .headingStyle2(
                  color: titleColor ?? const Color(0xFF404040), size: 14)
              .copyWith(fontWeight: FontWeight.w500),
          keyboardType: inputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffEEEEEE),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: border ??
                AppDecoration.of(context)
                    .border4(curve: 50, color: AppColor.of(context).grey),
            enabledBorder: enabledBorder ??
                AppDecoration.of(context)
                    .border4(curve: 50, color: AppColor.of(context).grey),
            disabledBorder: border ??
                AppDecoration.of(context)
                    .border4(curve: 50, color: AppColor.of(context).grey),
            errorBorder: border ??
                AppDecoration.of(context)
                    .border4(curve: 50, color: AppColor.of(context).redBG),
            focusedBorder: enabledBorder ??
                AppDecoration.of(context).border4(
                    curve: 50,
                    color: readOnly
                        ? AppColor.of(context).grey
                        : AppColor.of(context).primary),
            focusedErrorBorder: border ??
                AppDecoration.of(context)
                    .border4(curve: 50, color: AppColor.of(context).redBG),
            suffixIcon: suffix,
            prefixIcon: prefix,
            counter: counter,
            hintText: hint,
            isDense: true,
            errorStyle: AppText.of(context)
                .bodyStyle1(size: 12, color: AppColor.of(context).red),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: mandatory ? '$labelTxt' '*' : labelTxt,
            labelStyle: AppText.of(context)
                .bodyStyle1(
                    color: titleColor ?? const Color(0xFF7A7C80), size: 14)
                .copyWith(fontWeight: FontWeight.w400),
            hintStyle: hintStyle ??
                AppText.of(context)
                    .bodyStyle1(
                        color: titleColor ?? const Color(0xFF7A7C80), size: 14)
                    .copyWith(fontWeight: FontWeight.w500),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validatorFn,
          onChanged: onChanged ?? (String value) {},
          onTap: onTap ?? () {},
          onFieldSubmitted: onFiledSubmitted ?? (String value) {},
          onEditingComplete: onEditDone ?? () {},
        ),
      ],
    );
  }
}
