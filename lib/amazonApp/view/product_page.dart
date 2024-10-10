import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/product_provider.dart';

class ProductPage extends ConsumerWidget {
  final int productId;
  const ProductPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final productRef = ref.watch(productProvider(productId));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: productRef.when(
            data: (product) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: screenSize.height / 2.5,
                      width: screenSize.width,
                      child: Image.network(product.image)),
                  SizedBox(height: 20), // Display product image
                  Container(
                    color: Colors.brown.shade900,
                    height: screenSize.height / 1.5,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(" PRICE : \$${product.price.toString()}",
                            style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Center(
                              child: Text(product.description,
                                  style: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Set background color to white
                            foregroundColor:
                                Colors.orange, // Set text color to orange
                            side: BorderSide(
                                color: Colors.orange,
                                width: 2), // Add orange border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Set border radius to 12
                            ),
                            fixedSize: Size(screenSize.width / 1.2,
                                50), // Set the button's width and height
                          ),
                          child: Text(
                            "Buy",
                            style: TextStyle(
                                fontSize: 16), // Adjust text size if needed
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
        ),
      ),
    );
  }
}
