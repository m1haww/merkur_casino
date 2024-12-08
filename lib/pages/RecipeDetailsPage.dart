import 'package:flutter/material.dart';
import 'package:merkur_casino/models/recipes_info.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeInfo recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      appBar: AppBar(
        title: Text(recipe.recipeName),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                recipe.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              recipe.recipeName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Belgrano',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients: ${recipe.ingredients}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Preparation Time: ${recipe.preparationTime}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Difficulty: ${recipe.difficulty}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Cuisine: ${recipe.cuisine}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${recipe.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              recipe.instructions,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
