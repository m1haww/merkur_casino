import 'package:flutter/material.dart';
import 'package:merkur_casino/models/recipes_info.dart';

class ReceiptInstructions extends StatefulWidget {
  final RecipeInfo recipe;

  const ReceiptInstructions({super.key, required this.recipe});

  @override
  State<ReceiptInstructions> createState() => _ReceiptInstructionsState();
}

class _ReceiptInstructionsState extends State<ReceiptInstructions> {
  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      appBar: AppBar(
        backgroundColor: const Color(0xffFEEFAD),
        title: Text(
          recipe.recipeName,
          style: const TextStyle(
              fontFamily: 'Belgrano'), // Apply Belgrano font to app bar
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Center(
                  child: Image.asset(
                    recipe.image,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recipe Title
              Text(
                recipe.recipeName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              const SizedBox(height: 10),

              // Recipe Cuisine
              Text(
                "Cuisine: ${recipe.cuisine}",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              const SizedBox(height: 20),

              // Ingredients
              const Text(
                "Ingredients:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              Text(
                recipe.ingredients,
                style: const TextStyle(
                    fontFamily: 'Belgrano'), // Apply Belgrano font
              ),
              const SizedBox(height: 20),

              // Preparation Time
              Text(
                "Preparation Time: ${recipe.preparationTime}",
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              const SizedBox(height: 10),

              // Difficulty Level
              Text(
                "Difficulty: ${recipe.difficulty}",
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              const SizedBox(height: 10),

              // Servings
              Text(
                "Servings: ${recipe.servings}",
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              const SizedBox(height: 20),

              // Instructions
              const Text(
                "Instructions:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Belgrano', // Apply Belgrano font
                ),
              ),
              Text(
                recipe.instructions,
                style: const TextStyle(
                    fontFamily: 'Belgrano'), // Apply Belgrano font
              ),
            ],
          ),
        ),
      ),
    );
  }
}
