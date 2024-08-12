import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/Colors.dart';


class CustomTextFieldNum extends StatelessWidget {
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
  bool? IsonlyNumber;
  bool? IsReadOnly;
  bool? setFocus;
  void Function()? onTap;

  CustomTextFieldNum(
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
      this.maxLines,
      this.maxLength,
      this.IsReadOnly,
      this.IsonlyNumber,
      this.setFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: makeCaps == false
          ? TextCapitalization.none
          : TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: pro_primaryColor,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        //CurrencyInputFormatter(),
      ],
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      onTap: onTap,
      autofocus: setFocus??false,
      readOnly: IsReadOnly ?? false,
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
            OutlineInputBorder(borderSide: BorderSide(color: secondary_blue)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff8F8F8F), fontSize: 14),
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }
}
