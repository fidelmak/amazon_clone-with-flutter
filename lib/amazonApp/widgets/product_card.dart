import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final productImage;
  final String productPrice;
  final String productTitle;


  const ProductCard(
      {super.key,
      required this.productImage,
      required this.productPrice,
      required this.productTitle,
     });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2,
      width: screenSize.width / 3, // Increase the height to fit all elements
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                productImage,
                width: screenSize.width,
                height: screenSize.height / 8, // Adjust image height
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              productTitle,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productPrice,
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Add", style: TextStyle(color: Colors.red)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
