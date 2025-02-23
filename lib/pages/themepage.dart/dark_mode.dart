import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData DarkMode = ThemeData(
  iconTheme: IconThemeData(color: Colors.grey.shade100),
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  colorScheme: ColorScheme.dark(
    // ignore: deprecated_member_use
    background:  Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade100
  )
);