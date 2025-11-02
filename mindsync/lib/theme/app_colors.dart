import 'package:flutter/material.dart';

class AppColors {
  static const Color pastelBlue = Color(0xFFAECBFA);
  static const Color softBlue = Color(0xFFE0EFFF);
  static const Color textPrimary = Color(0xFF374151);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFF5F7FA);
  static const Color warmPeach = Color(0xFFFFDAC1);
  static const Color coolLavender = Color(0xFFD3C1FF);
  static const Color mintGreen = Color(0xFFC1FFD9);
  static const Color skyBlueLight = Color(0xFFC1ECFF);

  // Gradients and Shadows from the design aren't direct colors,
  // but we can define gradients here if needed later.
  static const Gradient primaryButtonGradient = LinearGradient(
    colors: [Color(0xFFc3e0ff), Color(0xFF91bbfa)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
