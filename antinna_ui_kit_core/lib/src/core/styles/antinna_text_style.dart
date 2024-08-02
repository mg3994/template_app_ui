import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../.dart';

class ANTINNATextStyle {
  const ANTINNATextStyle._();

  static TextStyle _base({
    double fontSize = 14,
    FontWeight? fontWeight = FontWeight.w400,
    double letterSpacing = 0.0,
    TextDecoration? decoration,
    Color? color,
    double? height,
  }) => GoogleFonts.inter(
     fontSize: fontSize * 1.sp,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing * 1.sp,
        height: height,
        textBaseline: TextBaseline.alphabetic,
        decoration:decoration,
        locale: const Locale('en', 'US'),
        color: color,
  ); 

  //TODO: Define your text style variant and your main text theme

  static TextTheme mainTextTheme = TextTheme(
    
  );

  
  static TextStyle antinna({
    FontWeight? fontWeight = 25,
    TextDecoration? decoration,
    Color? color,
    
}) => _base(
    fontSize: 42,
    fontWeight: fontWeight,decoration: decoration,color: color,
  );
  
}
