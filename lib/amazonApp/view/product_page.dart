import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/product_provider.dart';
import '../widgets/custom_button.dart';

class ProductPage extends ConsumerWidget {
  final int productId;
  const ProductPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final productRef = ref.watch(productProvider(productId));

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            screenSize: screenSize, text: 'Buy',
            onPressed: () {}, // Set the button width to half the screen width
          ),
        ),
        appBar: AppBar(
          title: Text('Product Details'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                    color: Colors.black,
                    //height: screenSize.height / 1.5,
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
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(" PRICE : \$${product.price.toString()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Center(
                              child: Text(product.description,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ),
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
