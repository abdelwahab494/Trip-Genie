import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:trip_genie/core/routing/routes.dart';

class MagicalSplashView extends StatefulWidget {
  const MagicalSplashView({super.key});

  @override
  State<MagicalSplashView> createState() => _MagicalSplashViewState();
}

class _MagicalSplashViewState extends State<MagicalSplashView> {
  @override
  void initState() {
    super.initState();
    // Navigate after the animations finish
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // Subtle radial gradient to make the lamp "glow"
          gradient: RadialGradient(
            colors: [Colors.white, Theme.of(context).scaffoldBackgroundColor],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. ANIMATED LOGO
            Image.asset(
                  'assets/images/Gemini_Generated_Image_jf7mtnjf7mtnjf7m__3_-removebg-preview.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                )
                .animate()
                .fadeIn(duration: 800.ms) // Slowly appears
                .scale(delay: 200.ms, curve: Curves.elasticOut) // Bounces in
                .shimmer(
                  delay: 1200.ms,
                  duration: 1800.ms,
                ), // A magical light runs over it

            const SizedBox(height: 20),

            // 2. ANIMATED TEXT
            Text(
                  "Trip Genie",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 5,
                  ),
                )
                .animate()
                .fadeIn(delay: 1000.ms) // Appears after the lamp
                .slideY(begin: 0.5, end: 0) // Slides up as if coming from smoke
                .then() // Chains the next animation
                .tint(color: Colors.amber), // Gives it a golden glow

            const SizedBox(height: 8),

            // 3. SUBTITLE
            Text(
              "Your journey, our magic",
              style: Theme.of(context).textTheme.bodySmall,
            ).animate().fadeIn(delay: 1800.ms).blurXY(begin: 10, end: 0),
          ],
        ),
      ),
    );
  }
}
