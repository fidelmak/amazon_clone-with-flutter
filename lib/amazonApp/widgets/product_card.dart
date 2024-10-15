import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final productImage;
  final VoidCallback addFunc;
  final String productPrice;
  final String productTitle;
  final double h;

  const ProductCard({
    super.key,
    required this.productImage,
    required this.h,
    required this.productPrice,
    required this.productTitle,
    required this.addFunc,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: h, // Dynamic height passed as a parameter
      width: screenSize.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.orange, // Set the border color to orange
          width: 2.0, // Set the width of the border
        ),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                productImage,
                width: double.infinity,
                height: h / 2, // Image height relative to card height
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: screenSize.width,

              // Make the container fill the parent
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align text to the start
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      productTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenSize.width / 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Pushes the Row to the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productPrice,
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextButton(
                        onPressed: addFunc,
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
