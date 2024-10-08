import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/colors.dart';
import '../provider/product_provider.dart';

class ProductPage extends ConsumerWidget {
  final int productId;
  const ProductPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final productRef = ref.watch(productProvider(productId));

    return Scaffold(
      backgroundColor: MyGlobal.textGrey.withOpacity(0.5),
      body: SingleChildScrollView(
        child: productRef.when(
          data: (product) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(product.image), // Display product image
                Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("\$${product.price.toString()}"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(product.description),
                ),
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
