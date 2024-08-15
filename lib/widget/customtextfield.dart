import 'package:flutter/material.dart';

import '../helper/Colors.dart';


class CustomTextField extends StatelessWidget {
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  String? hintText;
  Widget? prefixIcon;
  Widget? sufixIcon;
  TextEditingController? controller;
  bool? obscureText;
  bool? enabled;
  int? maxLines;
  int? maxLength;
  bool? makeCaps;
  bool? readonly;
  String? Function(String)? onFielsSubmit;
  void Function()? onTap;

  CustomTextField(
      {Key? key,
      this.onTap,
      this.enabled,
      this.makeCaps,
      this.obscureText,
      this.sufixIcon,
      this.controller,
      this.keyboardType,
      this.validator,
      this.hintText,
      this.prefixIcon,
      this.readonly,
      this.maxLines,
      this.onFielsSubmit,
      this.maxLength,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: makeCaps == false
          ? TextCapitalization.none
          : TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: pro_primaryColor,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      readOnly: readonly ?? false,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onFieldSubmitted: onFielsSubmit,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.0),
        filled: true,
        fillColor: Colors.white,
        enabled: enabled ?? true,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: greylinebox)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: greylinebox)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: pro_secondaryColor)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff8F8F8F), fontSize: 14),
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.redAccent)
        )
      ),
    );
  }
}
