import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF3949AB); // indigo[700]
  static const Color primaryLight = Color(0xFF6F74DD);
  static const Color primaryDark = Color(0xFF00227B);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: primaryLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.black26,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 6,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        elevation: 3,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: const BorderSide(color: primary, width: 2),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: primary),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: primary, width: 2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F7),
    dividerTheme: DividerThemeData(color: Colors.grey.shade200, thickness: 1),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(
      primary: primaryLight,
      secondary: primary,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: primaryDark, elevation: 0),
    scaffoldBackgroundColor: const Color(0xFF121212),
  );

  // Helper gradients
  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [primary, primaryLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
