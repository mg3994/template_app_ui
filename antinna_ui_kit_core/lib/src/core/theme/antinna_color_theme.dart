import 'package:flutter/material.dart';

import '../../../.dart';

class ANTINNAColorTheme extends ThemeExtension<ANTINNAColorTheme> {

  const ANTINNAColorTheme({
    
    this.red1,
    
    
  });

  
  final Color? red1;
  
  
  @override
  ThemeExtension<ANTINNAColorTheme> copyWith({
    
    Color? red1,
    
    
  }) => ANTINNAColorTheme(
    
    red1: red1 ?? this.red1,
    
    
  );

  @override
  ThemeExtension<ANTINNAColorTheme> lerp(
     covariant ThemeExtension<ANTINNAColorTheme>? other,
    double t,
  ) {
    if(other is! ANTINNAColorTheme){
      return this;
    }

    return ANTINNAColorTheme(
       
       red1: Color.lerp(red1, other.red1, t),
       
       
    );
  }

  /// Light color scheme
  static final ANTINNAColorTheme light =  ANTINNAColorTheme(
      
      red1: ANTINNAColors.red[1],
      
      
  );
  
  /// Dark color scheme
  static final ANTINNAColorTheme dark =  ANTINNAColorTheme(
      
      red1: ANTINNAColors.red[1],
      
      
  );

  @override
  String toString() {
    return 'ANTINNAColorTheme('
      
      'red1: $red1, '
      
      
    ')';
  }
}
