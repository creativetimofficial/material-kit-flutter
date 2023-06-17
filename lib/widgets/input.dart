import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

class Input extends StatelessWidget {
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final bool? filled;
  final Color? fillColor;
  final Color textColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final bool outlineBorder;
  final Color? cursorColor;
  final Color? hintTextColor;

  Input(
      {this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.filled,
      this.fillColor,
      this.textColor = Colors.black,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.cursorColor,
      this.hintTextColor,
      this.onChanged,
      this.outlineBorder = false,
      this.autofocus = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: cursorColor ?? MaterialColors.muted,
        onTap: () => onTap,
        onChanged: (val) => onChanged,
        controller: controller,
        autofocus: autofocus,
        style: TextStyle(
          height: 0.85,
          fontSize: 14.0,
          color: textColor,
        ),
        textAlignVertical: TextAlignVertical(y: 0.5),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 16, bottom: outlineBorder ? 20 : 16),
            filled: filled,
            fillColor: fillColor,
            hintStyle: TextStyle(color: hintTextColor ?? MaterialColors.muted,),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: outlineBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: enabledBorderColor ?? MaterialColors.muted))
                : UnderlineInputBorder(
                    borderSide: BorderSide(color: enabledBorderColor ?? MaterialColors.muted)),
            focusedBorder: outlineBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: focusedBorderColor ?? MaterialColors.primary))
                : UnderlineInputBorder(
                    borderSide: BorderSide(color: focusedBorderColor ?? MaterialColors.primary)),
            hintText: placeholder
        ),
    );
  }
}
