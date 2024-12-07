import 'package:flutter/material.dart';

class NotiteInteresante extends StatefulWidget {
  const NotiteInteresante({super.key});

  @override
  State<NotiteInteresante> createState() => _NotiteInteresanteState();
}

class _NotiteInteresanteState extends State<NotiteInteresante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'images/notes.png', // Ensure the image path is correct
              fit: BoxFit
                  .fill, // This ensures the image fills the screen completely
            ),
          ),
          // Other widgets layered on top
          const SafeArea(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
