import 'package:flutter/material.dart';
import 'package:merkur_casino/pages/bara_de%20_navigare.dart';

class PrimaPag extends StatefulWidget {
  const PrimaPag({super.key});

  @override
  State<PrimaPag> createState() => _PrimaPagState();
}

class _PrimaPagState extends State<PrimaPag>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Create the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Scale animation (zoom effect)
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Rotation animation
    _rotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Color animation (from red to green)
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController.forward();

    // Navigate after delay
    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Baradenavigare(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/soare.webp"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Animated Text with color, rotation, and scaling
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Text(
                      "MERKUR",
                      style: TextStyle(
                        fontFamily: "Belgrano",
                        fontSize: 40,
                        color: _colorAnimation.value,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
