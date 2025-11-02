import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindsync/theme/app_colors.dart';
import 'package:mindsync/theme/app_spacing.dart';
import 'package:mindsync/theme/app_typography.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.softBlue, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            const _AbstractBlob(color: AppColors.warmPeach, top: 100, left: -50, scale: 1.5),
            const _AbstractBlob(color: AppColors.coolLavender, top: 250, right: -80, scale: 2.0),
            const _AbstractBlob(color: AppColors.mintGreen, bottom: 200, left: 20, scale: 1.2),
            const _AbstractBlob(color: AppColors.skyBlueLight, bottom: 50, right: -30, scale: 2.2),

            SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p32),
                children: [
                  const SizedBox(height: AppSpacing.p48),
                  const Icon(Icons.cloud_outlined, color: AppColors.pastelBlue, size: 72),
                  const SizedBox(height: AppSpacing.p16),
                  Text(
                    'MindSync',
                    textAlign: TextAlign.center,
                    style: AppTypography.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.p48),
                  const Text('メールアドレス', style: AppTypography.bodyMedium),
                  const SizedBox(height: AppSpacing.p8),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'your@email.com'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSpacing.p24),
                  const Text('パスワード', style: AppTypography.bodyMedium),
                  const SizedBox(height: AppSpacing.p8),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: '********'),
                  ),
                  const SizedBox(height: AppSpacing.p16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('パスワードを忘れた場合', style: TextStyle(color: AppColors.pastelBlue)),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.p24),
                  _GradientElevatedButton(
                    onPressed: () {
                      print('Login with email tapped');
                    },
                    text: 'ログイン',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.p32),
                    child: Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p16),
                          child: Text('または', style: AppTypography.bodyMedium),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  _SocialLoginButton(
                    onPressed: () {},
                    text: 'Googleでログイン',
                    icon: Icons.android,
                  ),
                  const SizedBox(height: AppSpacing.p16),
                  _SocialLoginButton(
                    onPressed: () {},
                    text: 'Appleでログイン',
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    icon: Icons.apple,
                  ),
                  const SizedBox(height: AppSpacing.p32),
                  Center(
                    child: TextButton(
                      onPressed: () => context.go('/signup'),
                      child: const Text(
                        'アカウントをお持ちでない場合、新規登録',
                        style: TextStyle(color: AppColors.pastelBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientElevatedButton extends StatelessWidget {
  const _GradientElevatedButton({required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppSpacing.borderRadiusXLarge),
        elevation: 5,
        shadowColor: AppColors.pastelBlue.withOpacity(0.5),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.primaryButtonGradient,
          borderRadius: AppSpacing.borderRadiusXLarge,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.p16),
          child: Text(text, style: AppTypography.button),
        ),
      ),
    );
  }
}

// ... (Rest of the widgets are the same)
class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.onPressed,
    required this.text,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.foregroundColor = AppColors.textPrimary,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        textStyle: AppTypography.button.copyWith(color: foregroundColor, fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.p12),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXLarge,
        ),
      ),
    );
  }
}

class _AbstractBlob extends StatelessWidget {
  const _AbstractBlob({
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.scale = 1.0,
  });

  final Color color;
  final double? top, bottom, left, right;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
