import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData LightMode = ThemeData(
  iconTheme: IconThemeData(color: Colors.grey.shade900),
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  colorScheme: ColorScheme.light(
    background:  Colors.grey.shade200,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade900,
    inversePrimary: Colors.grey.shade900
  )
);