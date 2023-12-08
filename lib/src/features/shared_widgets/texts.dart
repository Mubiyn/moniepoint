import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/core/resources/resources.dart';

class HeaderTexts extends StatelessWidget {
  const HeaderTexts(
    this._text, {
    super.key,
    this.bottomPadding,
  });
  final String _text;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: yPadding, bottom: bottomPadding ?? yPadding),
      child: Text(
        _text,
        style: context.displayMedium.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class MoniepointTextField extends StatelessWidget {
  const MoniepointTextField({
    Key? key,
    required this.hintText,
    this.textInputType,
    required this.validator,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.autovalidateMode,
    required this.prefixIcon,
    this.bottomPadding,
    this.readOnly = false,
  }) : super(key: key);

  final String hintText;
  final TextInputType? textInputType;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final Widget prefixIcon;
  final AutovalidateMode? autovalidateMode;
  final double? bottomPadding;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? yPadding),
      child: TextFormField(
        style: context.bodyLarge,
        validator: validator,
        readOnly: readOnly!,
        keyboardType: textInputType,
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: yPadding,
            horizontal: xPadding,
          ),
          hintText: hintText,
          hintStyle: context.bodyMedium,
          filled: true,
          fillColor: kColorGreyLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(
              color: kColorGreyLight,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(
              color: kColorGreyLight,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(color: kColorGreyLight),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(color: kColorOrange),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((textFieldBorderRadius)),
            borderSide: const BorderSide(color: kColorOrange),
          ),
          errorStyle: context.bodySmall.copyWith(
              fontSize: textFontSize * 0.8,
              color: kColorOrange,
              fontWeight: FontWeight.w400),
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              XSpace(xPadding),
              prefixIcon,
              XSpace(xPaddingSmall),
              Container(
                width: 1,
                height: 25.h,
                color: kColorGrey,
              ),
              XSpace(xPaddingSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class MoniePointDropDownField extends StatelessWidget {
  final String hintText;
  final List<String> dropdownItems;
  final void Function(String?)? onChanged;
  final String? value;
  final Widget prefixIcon;
  const MoniePointDropDownField({
    Key? key,
    required this.hintText,
    required this.dropdownItems,
    required this.onChanged,
    required this.value,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: yPadding),
      padding: EdgeInsets.symmetric(
          horizontal: xPadding, vertical: yPaddingSmall * 0.8),
      decoration: BoxDecoration(
        color: kColorWhite,
        border: Border.all(color: kColorGreyLight, width: 0.7),
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: kColorGreyLight,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixIcon,
          XSpace(xPadding * 0.7),
          Container(
            width: 1,
            height: 25.h,
            color: kColorGrey,
          ),
          XSpace(xPadding * 0.7),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  borderRadius: BorderRadius.circular(textFieldBorderRadius),
                  isExpanded: true,
                  value: value,
                  style: context.displayMedium,
                  hint: Text(hintText, style: context.bodyMedium),
                  items: dropdownItems
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          ))
                      .toList(),
                  onChanged: onChanged,
                  icon: const Icon(Icons.keyboard_arrow_down)),
            ),
          ),
        ],
      ),
    );
  }
}
