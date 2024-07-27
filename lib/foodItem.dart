import 'package:flutter/material.dart';
import 'package:testflutter/detail.dart';

class FoodItemData {
  final String name;
  final String imageUrl;
  final Color color;

  FoodItemData(this.name, this.imageUrl, this.color);
}

class FoodItem extends StatelessWidget {
  final FoodItemData foodData;

  const FoodItem({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTapUp: (details) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => FoodItemDetailPage(foodData: foodData),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
          ),
        );
      },
     child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: foodData.color ,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: foodData.color.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                foodData.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.error));
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: 20,left: 12,right: 12),
              child: Center(
                child: Text(
                  foodData.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}