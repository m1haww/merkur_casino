import 'package:flutter/material.dart';
import 'package:merkur_casino/models/recipes_info.dart';
import 'package:merkur_casino/pages/RecipeDetailsPage.dart';

class SeeAllRecipesPage extends StatelessWidget {
  final List<RecipeInfo> recipes;

  const SeeAllRecipesPage({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      appBar: AppBar(
        title:
            const Text("Top Recipes", style: TextStyle(fontFamily: 'Belgrano')),
        backgroundColor: const Color(0xffFEEFAD),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeCard(recipe: recipe);
          },
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final RecipeInfo recipe;

  const RecipeCard({
    super.key,
    required this.recipe, // Pass the whole RecipeInfo object
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the detailed recipe page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailsPage(
                    recipe: recipe, // Pass the entire RecipeInfo object
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                recipe.image, // Use recipe.image
                height: height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recipe.recipeName, // Use recipe.recipeName
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Belgrano',
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.timer, size: 16, color: Colors.black54),
              const SizedBox(width: 5),
              Text(
                recipe.preparationTime, // Use recipe.preparationTime
                style: const TextStyle(
                    color: Colors.black54, fontFamily: 'Belgrano'),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.check_circle, size: 16, color: Colors.black54),
              const SizedBox(width: 5),
              Text(
                recipe.difficulty, // Use recipe.difficulty
                style: const TextStyle(
                    color: Colors.black54, fontFamily: 'Belgrano'),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.cookie_outlined,
                  size: 16, color: Colors.black54),
              const SizedBox(width: 5),
              Text(
                recipe.description, // Use recipe.description
                style: const TextStyle(
                    color: Colors.black54, fontFamily: 'Belgrano'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
