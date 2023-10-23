import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// An extension on `TextStyle` to customize the color of text.
extension TextStyleColorExtension on TextStyle {
  /// Creates a new `TextStyle` with the provided [color].
  ///
  /// - [color]: The color to apply to the text.
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}

/// An extension on `TextStyle` to customize the font weight of text.
extension TextStyleBoldExtension on TextStyle {
  /// Creates a new `TextStyle` with the provided [fontWeight].
  ///
  /// - [fontWeight]: The font weight to apply to the text.
  TextStyle withFontWeight(FontWeight fontWeight) {
    return copyWith(fontWeight: fontWeight);
  }
}

/// An extension on `TextTheme` that provides custom text styles.
extension CustomStyles on TextTheme {
  /// Gets a custom text style for title level 1.
  TextStyle get title01 {
    return TextStyle(
      fontFamily: 'GothamSSm-Bold',
      fontSize: 18.0.sp,
    );
  }

  /// Gets a custom text style for title level 2.
  TextStyle get title02 {
    return TextStyle(
      fontFamily: 'GothamSSm-Bold',
      fontSize: 16.0.sp,
    );
  }

  /// Gets a custom text style for title level 3 with medium font weight.
  TextStyle get title03 {
    return TextStyle(
      fontFamily: 'GothamSSm-Medium',
      fontSize: 16.0.sp,
    );
  }

  /// Gets a custom text style for the main body text.
  TextStyle get body {
    return TextStyle(
      fontFamily: 'GothamSSm-Book',
      fontSize: 12.0.sp,
    );
  }

  /// Gets a custom text style for input fields.
  TextStyle get input {
    return TextStyle(
      fontFamily: 'GothamSSm-Light',
      fontSize: 12.0.sp,
    );
  }

  /// Gets a custom text style for hint text in input fields.
  TextStyle get hint {
    return TextStyle(
      fontFamily: 'GothamSSm-Book',
      fontSize: 12.0.sp,
    );
  }

  /// Gets a custom text style for subtitles.
  TextStyle get subtitle {
    return TextStyle(
      fontFamily: 'GothamSSm-Book',
      fontSize: 10.0.sp,
    );
  }

  /// Gets a custom text style for detailed information.
  TextStyle get detail {
    return TextStyle(
      fontFamily: 'GothamSSm-Book',
      fontSize: 12.0.sp,
    );
  }
}
