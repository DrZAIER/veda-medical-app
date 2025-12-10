
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Medical but Modern Gradient Colors
  static const Color primaryBlue = Color(0xFF2563EB); // Vivid Blue
  static const Color secondaryTeal = Color(0xFF06B6D4); // Cyan/Teal
  static const Color accentIndigo = Color(0xFF4F46E5); // Indigo
  static const Color backgroundLight = Color(0xFFF8FAFC); // Slate 50
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, secondaryTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFF0F9FF)], // White to very light blue
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: secondaryTeal,
        tertiary: accentIndigo,
        background: backgroundLight,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundLight,
      
      // Typography with Google Fonts
      textTheme: GoogleFonts.outfitTextTheme().copyWith(
        displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.black87),
        headlineSmall: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: Colors.blueGrey[900]),
        titleMedium: GoogleFonts.outfit(fontWeight: FontWeight.w500),
      ),

      // Modern Card Theme
      // cardTheme: const CardTheme(
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      //   color: Colors.white,
      // ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
        labelStyle: GoogleFonts.outfit(color: Colors.grey.shade600),
      ),

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          color: Colors.black87,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
    );
  }
}
