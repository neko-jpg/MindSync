import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindsync/theme/app_colors.dart';
import 'package:mindsync/theme/app_spacing.dart';
import 'package:mindsync/theme/app_typography.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            const _AbstractBlob(color: AppColors.pastelBlue, top: 400, left: -40, scale: 1.0),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p32),
                child: ListView(
                  children: [
                    const SizedBox(height: AppSpacing.p48),
                    const Icon(Icons.cloud_outlined, color: AppColors.pastelBlue, size: 72),
                    Text('MindSync', style: AppTypography.headlineLarge.copyWith(fontSize: 52), textAlign: TextAlign.center),
                    const SizedBox(height: AppSpacing.p8),
                    Text(
                      '孤独を、データで共感へ。',
                      style: AppTypography.bodyLarge.copyWith(color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.p48),
                    const _FeatureCard(
                      icon: Icons.psychology,
                      title: '感情同期',
                      description: 'あなたの感情パターンを理解し共有します',
                    ),
                    const SizedBox(height: AppSpacing.p24),
                    const _FeatureCard(
                      icon: Icons.diversity_3,
                      title: '感情マッチング',
                      description: '共感できる仲間を見つけて繋がりを深めます',
                    ),
                    const SizedBox(height: AppSpacing.p48),
                    _GradientElevatedButton(
                      onPressed: () => context.go('/signup'),
                      text: 'はじめる',
                    ),
                    const SizedBox(height: AppSpacing.p16),
                    OutlinedButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('ログイン'),
                    ),
                    const SizedBox(height: AppSpacing.p24),
                  ],
                ),
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
// ... (rest of the widgets)
class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.p24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: AppSpacing.borderRadiusXLarge,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.8)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.p16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.softBlue.withOpacity(0.5), AppColors.pastelBlue.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: AppColors.pastelBlue, size: 36),
          ),
          const SizedBox(height: AppSpacing.p16),
          Text(title, style: AppTypography.titleLarge),
          const SizedBox(height: AppSpacing.p8),
          Text(
            description,
            style: AppTypography.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
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
