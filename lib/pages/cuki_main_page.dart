import 'package:flutter/material.dart';
import 'package:merkur_casino/models/custom_container.dart';
import 'package:merkur_casino/models/recipes_info.dart';
import 'package:merkur_casino/pages/receipt_instructions.dart';

class cukimainpage extends StatelessWidget {
  const cukimainpage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5B4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage('images/curry.jpg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Welcome, dear friend',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Belgrano',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Discover recipes using what’s in your pantry',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontFamily: 'Belgrano',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              const CustomContainer(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Culinary Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Belgrano',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.orange, fontFamily: 'Belgrano'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Colors.orange,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'Morning Bites'),
                        Tab(text: 'Midday Meals'),
                        Tab(text: 'Evening Feasts'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                        children: [
                          RecipeListTab(recipes: morningBites),
                          RecipeListTab(recipes: middayMeals),
                          RecipeListTab(recipes: eveningFeasts),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeListTab extends StatelessWidget {
  final List<RecipeInfo> recipes;

  const RecipeListTab({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: recipes.map((recipe) {
          return RecipeCard(
            recipe: recipe, // Pass the entire RecipeInfo object here
          );
        }).toList(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReceiptInstructions(
                    recipe: recipe, // Pass the entire RecipeInfo object
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                recipe.image, // Use recipe.image
                height: 120,
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
