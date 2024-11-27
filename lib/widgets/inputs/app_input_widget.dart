import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';

class AppInputWidget extends StatefulWidget {
  const AppInputWidget(
      {super.key,
      this.hintText,
      this.prefix,
      this.suffixIcon,
      this.isPassWord = false,
      this.isEmail = false,
      this.textInputAction = TextInputAction.next,
      this.controller,
      this.keyboardType,
      this.fillColor,
      this.elevation = 0.0,
      this.elevationColor,
      this.minLines = 1,
      this.readOnly = false,
      this.border,
      this.errBorder,
      this.borderRadius,
      this.contentPadding,
      this.style,
      this.maxLines,
      this.onFieldSubmitted,
      this.onTap,
      this.filled = true,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.textAlignVertical = TextAlignVertical.top});

  final String? hintText;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool isPassWord;
  final bool readOnly;
  final bool isEmail;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final bool filled;
  final double elevation;
  final Color? elevationColor;
  final int minLines;
  final int? maxLines;
  final InputBorder? border;
  final InputBorder? errBorder;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final TextAlignVertical textAlignVertical;

  @override
  State<AppInputWidget> createState() => _AppInputWidgetState();
}

class _AppInputWidgetState extends State<AppInputWidget> {
  bool isShowPassWord = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ??
          BorderRadius.circular(AppSize.width(value: 8.0)),
      child: Material(
        elevation: widget.elevation,
        shadowColor: widget.elevationColor,
        borderOnForeground: false,
        color: Colors.transparent,
        borderRadius: widget.borderRadius ??
            BorderRadius.circular(AppSize.width(value: 8.0)),
        child: TextFormField(
          onTapOutside: ((ajay) {
            FocusScope.of(context).unfocus();
          }),
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          controller: widget.controller,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            if (widget.isPassWord && value.length < 8) {
              return "Must be at last 8 characters.";
            }
            if (widget.isEmail) {
              if (value.toString().isEmail) return null;
              return "Please provide valid email address";
            }

            return null;
          },
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isPassWord && isShowPassWord,
          obscuringCharacter: "*",
          textAlignVertical: widget.textAlignVertical,
          style: widget.style ??
              const TextStyle(
                  height: 2,
                  fontFamily: AppConst.fontFamily1,
                  fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                EdgeInsets.all(AppSize.width(value: 10.0)),
            filled: widget.filled,
            fillColor: widget.fillColor ?? AppColors.white50.withOpacity(0.3),
            prefixIcon: widget.prefix,
            prefixIconConstraints: widget.prefixIconConstraints ??
                BoxConstraints(
                    maxWidth: AppSize.width(value: 40),
                    maxHeight: AppSize.width(value: 40)),
            suffixIconConstraints: widget.suffixIconConstraints ??
                BoxConstraints(
                    maxWidth: AppSize.width(value: 40),
                    maxHeight: AppSize.width(value: 40)),
            suffixIcon: widget.isPassWord
                ? Container(
                    margin: const EdgeInsets.all(5),
                    width: 10,
                    height: 10,
                    child: IconButton(
                        color: AppColors.black300,
                        padding: EdgeInsets.zero,
                        highlightColor: AppColors.white500,
                        onPressed: () {
                          setState(() {
                            isShowPassWord = !isShowPassWord;
                          });
                        },
                        icon: isShowPassWord
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.black300),
            border: widget.border ?? InputBorder.none,
            enabledBorder: widget.border ?? InputBorder.none,
            focusedBorder: widget.border ?? InputBorder.none,
            errorBorder: widget.errBorder ?? InputBorder.none,
            focusedErrorBorder: widget.errBorder ?? InputBorder.none,
          ),
        ),
      ),
    );
  }
}
