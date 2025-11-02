import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.pastelBlue,
    scaffoldBackgroundColor: AppColors.softBlue,
    colorScheme: const ColorScheme.light(
      primary: AppColors.pastelBlue,
      secondary: AppColors.softBlue,
      onPrimary: Colors.white,
      onSecondary: AppColors.textPrimary,
      surface: Colors.white,
      onSurface: AppColors.textPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTypography.headlineLarge,
      displayMedium: AppTypography.headlineMedium,
      titleLarge: AppTypography.titleLarge,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent, // Use gradient for background
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.p16),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXLarge,
        ),
        textStyle: AppTypography.button,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.pastelBlue,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.p12),
        side: const BorderSide(color: AppColors.pastelBlue, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXLarge,
        ),
        textStyle: AppTypography.button.copyWith(color: AppColors.pastelBlue),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.7),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.p20,
        vertical: AppSpacing.p16,
      ),
      border: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusXLarge,
        borderSide: BorderSide(color: AppColors.pastelBlue.withOpacity(0.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusXLarge,
        borderSide: BorderSide(color: AppColors.pastelBlue.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusXLarge,
        borderSide: const BorderSide(color: AppColors.pastelBlue, width: 2),
      ),
      hintStyle: AppTypography.bodyLarge.copyWith(color: AppColors.textSecondary.withOpacity(0.6)),
    ),
  );
}
