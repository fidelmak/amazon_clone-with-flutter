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
    final ScreenSize = MediaQuery.of(context).size;
    final ProductRef = ref.watch(ProductFutureProvider);
    final ProductJewery = ref.watch(productJeweleryProvider);

    return Scaffold(
        backgroundColor: MyGlobal.textGrey.withOpacity(0.5),
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
                  // Set background color to black
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 24, // Set icon color to white
                  ),
                ),
              ),
            )
          ],
          // Use the custom EcomNavbar widget here
          backgroundColor: MyGlobal.textColor,
          toolbarHeight: 60, // Set AppBar background color
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header and SectionText here
              Header(ScreenSize: ScreenSize),
              Center(
                  child: SectionText(
                yourText: "Jewelery",
              )),

              // Use ProductRef.when outside GridView
              ProductJewery.when(data: (products) {
                return GridView.count(
                  shrinkWrap:
                      true, // Ensures the grid only takes up as much space as needed
                  crossAxisCount: 2,
                  // Set the number of items per row
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling within the grid
                  children: products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((ctx) =>
                                      ProductPage(productId: product.id))));
                        },
                        child: ProductCard(
                          productImage: product.image,
                          productPrice: "\$${product.price.toString()}",
                          productTitle: product.title,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }, error: (error, _) {
                return Text(error.toString());
              }, loading: () {
                return CircularProgressIndicator();
              }),
              Center(
                  child: SectionText(
                yourText: 'All Products',
              )),

              ProductRef.when(data: (products) {
                return GridView.count(
                  shrinkWrap:
                      true, // Ensures the grid only takes up as much space as needed
                  crossAxisCount: 2,
                  // Set the number of items per row
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling within the grid
                  children: products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(
                        productImage: product.image,
                        productPrice: "\$${product.price.toString()}",
                        productTitle: product.title,
                      ),
                    );
                  }).toList(),
                );
              }, error: (error, _) {
                return Text(error.toString());
              }, loading: () {
                return CircularProgressIndicator();
              }),
            ],
          ),
        ));
  }
}

////////////////////////////////////////

/////////////// Widgets

//////////////////////////////////////
