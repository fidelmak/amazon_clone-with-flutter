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
        backgroundColor: Colors.orange.withOpacity(0.2),
        body: SingleChildScrollView(
          child: productRef.when(
            data: (product) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(product.image),
                  SizedBox(height: 20), // Display product image
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(" PRICE : \$${product.price.toString()}"),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(child: Text(product.description)),
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
                          color: Colors.orange, width: 2), // Add orange border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Set border radius to 12
                      ),
                      fixedSize: Size(screenSize.width / 1.2,
                          50), // Set the button's width and height
                    ),
                    child: Text(
                      "Buy",
                      style:
                          TextStyle(fontSize: 16), // Adjust text size if needed
                    ),
                  )
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
