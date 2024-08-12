import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? letterSpacing;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign ? textAlign;
  final TextOverflow? textOverflow; 
  final int? maxLines;
  final bool? softWrap;

  const CustomText({Key? key,
    this.maxLines ,this.textOverflow ,this.text, this.size, this.color, this.weight,
    this.textAlign, this.softWrap, this.letterSpacing,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: true,
      textScaleFactor: 1.0,       // THIS IS THE ONLY IMPORTANT PART //
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? 0.0,
      ),
    );
  }
}