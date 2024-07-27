import 'package:flutter/material.dart';
import 'package:testflutter/foodItem.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FoodItemData> foodItems = [
    FoodItemData("Fresh Fruits & Vegetables", "assets/images/vegetable.png", Colors.green),
    FoodItemData("Cooking Oil & Ghee", "assets/images/oil.png", Colors.orangeAccent),
    FoodItemData("Meat & Fish", "assets/images/proteins.png", Colors.redAccent),
    FoodItemData("Bakery & Snacks", "assets/images/bakery.png", Colors.purpleAccent),
    FoodItemData("Dairy & Eggs", "assets/images/eggs.png", Colors.yellow),
    FoodItemData("Beverages", "assets/images/soft-drinks.png", Colors.blueAccent),
    FoodItemData("Vegetables", "assets/images/vegetable.png", Colors.purple),
    FoodItemData("Vegetables", "assets/images/vegetable.png", Colors.pinkAccent),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          _buildSearchField(),
          SizedBox(height: 20),
          _buildFoodCategory(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Find Products",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Search Store',
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Food Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return FoodItem(
              foodData: foodItems[index],
            );
          },
        ),
      ],
    );
  }
}