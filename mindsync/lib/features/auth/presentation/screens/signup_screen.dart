import 'package:flutter/material.dart';
import 'package:mindsync/theme/app_colors.dart';
import 'package:mindsync/theme/app_typography.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
        backgroundColor: AppColors.softBlue,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      backgroundColor: AppColors.softBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_alt_1_outlined,
              size: 80,
              color: AppColors.pastelBlue,
            ),
            const SizedBox(height: 24),
            Text(
              'SignUp Screen',
              style: AppTypography.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'This is a placeholder for the sign-up process.',
              style: AppTypography.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
