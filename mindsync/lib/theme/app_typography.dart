import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 48, // Approximating text-5xl
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 36, // Approximating text-4xl
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20, // Approximating text-lg
    fontWeight: FontWeight.w600, // semibold
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16, // text-base
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5, // leading-relaxed
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14, // text-sm
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle button = TextStyle(
    fontSize: 18, // text-lg
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );
}
