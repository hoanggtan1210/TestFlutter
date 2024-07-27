import 'package:flutter/material.dart';
import 'package:testflutter/foodItem.dart';

class FoodItemDetailPage extends StatefulWidget {
  final FoodItemData foodData;
  const FoodItemDetailPage({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  @override
  _FoodItemDetailPageState createState() => _FoodItemDetailPageState();
}

class _FoodItemDetailPageState extends State<FoodItemDetailPage> {
  final bool customIcon = false ;

  int _quantity = 1;
  void upQuantity() {
    setState(() {
      _quantity++;
    });
  }
  void downQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:SingleChildScrollView(
       child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
                ),
                width: double.infinity,
                height: screenHeight * 0.4,
                child: Image.asset(
                  widget.foodData.imageUrl,
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 20,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.ios_share, color: Colors.black),
                  onPressed: () {
                    // Implement share functionality here
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.foodData.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement favorite functionality here
                      },
                      icon: const Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
                const Text(
                  '1kg, Price', // Show dynamic price
                  style:  TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.grey),
                          iconSize: 36, // Adjust icon size
                          onPressed: downQuantity,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 25, // Font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.green),
                          iconSize: 36, // Adjust icon size
                          onPressed: upQuantity,
                        ),
                      ],
                    ),
                    const Text(
                      '\$4.99', // Show total price
                      style:  TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                 const ExpansionTile(
                  title: Text('Product Detail',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For The Heart. As Part Of A Healthy And Varied Diet.',
                      style: TextStyle(fontSize: 16,color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                  ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nutritions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: const Text(
                          '100gr',
                          style: TextStyle(
                            color: Colors.black, // Chữ đen
                            fontSize: 16,
                          ),
                        ),
                      ),

                    ],
                  ),
                  children: [
                     Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For The Heart. As Part Of A Healthy And Varied Diet.',
                        style: TextStyle(fontSize: 16,color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Review',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      Row(
                        children: List.generate(5, (index) => Icon(Icons.star,color: Colors.red,))
                      )
                    ],
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For The Heart. As Part Of A Healthy And Varied Diet.',
                        style: TextStyle(fontSize: 16,color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
