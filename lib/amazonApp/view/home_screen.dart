import 'package:amazon_clone/amazonApp/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/colors.dart';
import '../provider/product_provider.dart';
import '../widgets/header.dart';
import '../widgets/product_card.dart';
import '../widgets/section_text.dart';

class EcomWeb extends ConsumerWidget {
  const EcomWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final ProductRef = ref.watch(ProductFutureProvider);
    final ProductJewery = ref.watch(productJeweleryProvider);

    return Scaffold(
      backgroundColor: MyGlobal.TextWhite,
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            "assets/images/amz.png",
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                width: 30,
                height: 30,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: MyGlobal.textColor,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header and SectionText
            Header(ScreenSize: screenSize),
            Center(child: SectionText(yourText: "Jewelery")),

            // Jewelry Product Grid
            ProductJewery.when(
              data: (products) {
                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: products.map((product) {
                    return SizedBox(
                      width: screenSize.width / 2 -
                          16, // 2 products per row, minus padding
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    ProductPage(productId: product.id),
                              ),
                            );
                          },
                          child: ProductCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 3.2, // Adjust card height
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              error: (error, _) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              },
            ),

            Center(child: SectionText(yourText: 'All')),

            // All Products Grid
            ProductRef.when(
              data: (products) {
                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: products.map((product) {
                    return SizedBox(
                      width: screenSize.width / 2 -
                          16, // 2 products per row, minus padding
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ProductCard(
                          productImage: product.image,
                          productPrice: "\$${product.price.toString()}",
                          productTitle: product.title,
                          h: screenSize.height / 3.2, // Adjust card height
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              error: (error, _) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
