class RecipeInfo {
  final String recipeName;
  final String ingredients;
  final String image;
  final String preparationTime;
  final String difficulty;
  final String servings;
  final String instructions;
  final String cuisine;
  final String description; // Added description for each recipe

  RecipeInfo({
    required this.recipeName,
    required this.ingredients,
    required this.image,
    required this.preparationTime,
    required this.difficulty,
    required this.servings,
    required this.instructions,
    required this.cuisine,
    required this.description, // Include description in the constructor
  });
}

List<RecipeInfo> morningBites = [
  RecipeInfo(
    recipeName: 'Pancakes',
    ingredients: 'Flour, milk, eggs, sugar, butter',
    image: 'images/pancakes.jpg',
    preparationTime: '15 min',
    difficulty: 'Easy',
    servings: '2',
    instructions: 'Mix ingredients and cook on a griddle.',
    cuisine: 'American',
    description: 'Delicious',
  ),
  RecipeInfo(
    recipeName: 'Omelette',
    ingredients: 'Eggs, cheese, onions, peppers, salt, pepper',
    image: 'images/omellete.webp',
    preparationTime: '10 min',
    difficulty: 'Easy',
    servings: '1',
    instructions: 'Whisk eggs, pour into pan, and add toppings.',
    cuisine: 'French',
    description: 'Tasty',
  ),
  RecipeInfo(
    recipeName: 'Smoothie Bowl',
    ingredients: 'Frozen fruits, yogurt, granola, honey',
    image: 'images/smoothie-8493725_1280.webp',
    preparationTime: '5 min',
    difficulty: 'Easy',
    servings: '1',
    instructions: 'Blend fruits and yogurt, top with granola and honey.',
    cuisine: 'Healthy',
    description: 'Refreshing',
  ),
];

List<RecipeInfo> middayMeals = [
  RecipeInfo(
    recipeName: 'Tacos',
    ingredients: 'Tortillas, ground beef, cheese, lettuce, tomatoes, sauce',
    image: 'images/tacos.webp',
    preparationTime: '20 min',
    difficulty: 'Easy',
    servings: '4',
    instructions:
        'Cook the meat, place it in the tortillas, and add the toppings.',
    cuisine: 'Mexican',
    description: 'Spicy',
  ),
  RecipeInfo(
    recipeName: 'Caesar Salad',
    ingredients: 'Lettuce, croutons, chicken, Caesar dressing, parmesan',
    image: 'images/salad_caesar.jpg',
    preparationTime: '10 min',
    difficulty: 'Easy',
    servings: '2',
    instructions: 'Toss lettuce, croutons, chicken, and dressing together.',
    cuisine: 'American',
    description: 'Delightful',
  ),
  RecipeInfo(
    recipeName: 'Chicken Wrap',
    ingredients: 'Chicken, tortilla, lettuce, cheese, sauce',
    image: 'images/chiken_wrap.jpg',
    preparationTime: '15 min',
    difficulty: 'Medium',
    servings: '2',
    instructions: 'Grill the chicken, wrap with toppings, and serve.',
    cuisine: 'American',
    description: 'Juicy',
  ),
];

List<RecipeInfo> eveningFeasts = [
  RecipeInfo(
    recipeName: 'Pizza Margherita',
    ingredients: 'Flour, water, yeast, tomatoes, mozzarella, basil',
    image: 'images/pizza.jpg',
    preparationTime: '30 min',
    difficulty: 'Medium',
    servings: '2',
    instructions:
        'Mix the ingredients for the dough, let it rise, add the toppings, and bake.',
    cuisine: 'Italian',
    description: 'Classic',
  ),
  RecipeInfo(
    recipeName: 'Spaghetti Bolognese',
    ingredients: 'Spaghetti, ground beef, tomatoes, onions, garlic, red wine',
    image: 'images/spaghetti-4746831_1280.jpg',
    preparationTime: '1h',
    difficulty: 'Medium',
    servings: '4',
    instructions:
        'Cook the meat, add tomatoes and seasonings, boil the spaghetti, and serve.',
    cuisine: 'Italian',
    description: 'Hearty',
  ),
  RecipeInfo(
    recipeName: 'Grilled Salmon',
    ingredients: 'Salmon, lemon, garlic, herbs, olive oil',
    image: 'images/salmon-6930255_1280.jpg',
    preparationTime: '20 min',
    difficulty: 'Medium',
    servings: '2',
    instructions:
        'Grill the salmon with lemon, garlic, and herbs until golden.',
    cuisine: 'Mediterranean',
    description: 'Flavorful',
  ),
];
