import 'package:amazon_clone/amazonApp/const/colors.dart';
import 'package:amazon_clone/amazonApp/provider/cart_provider.dart';
import 'package:amazon_clone/amazonApp/provider/product_provider.dart';
import 'package:amazon_clone/amazonApp/provider/state_notifiers.dart';
import 'package:amazon_clone/amazonApp/view/category_page.dart';
import 'package:amazon_clone/amazonApp/view/product_page.dart';
import 'package:amazon_clone/amazonApp/widgets/category_card.dart';
import 'package:amazon_clone/amazonApp/widgets/custom_bottom_nav.dart';
import 'package:amazon_clone/amazonApp/widgets/header.dart';
import 'package:amazon_clone/amazonApp/widgets/product_card.dart';
import 'package:amazon_clone/amazonApp/widgets/section_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/dimension_provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProviderRef = ref.watch(cartProvider.notifier);
    final screenSize = MediaQuery.of(context).size;
    final ProductRef = ref.watch(ProductFutureProvider);
    final ProductElectronics = ref.watch(productElectronicsProvider);
    final ProductMen = ref.watch(productMenClothingProvider);
    final ProductJewery = ref.watch(productJeweleryProvider);
    final ProductWomen = ref.watch(productWomenClothingProvider);
    final screenIndex = ref.watch(navigationProvider);

    AppScale _scale = AppScale(context);

    void _onItemTapped(int index) {
      ref.read(navigationProvider.notifier).navigate(index);
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/cart');
          break;
        case 2:
          context.go('/history');
          break;
      }
    }

    return Scaffold(
      backgroundColor: MyGlobal.TextWhite,
      bottomNavigationBar: const CustomNavBar(),
      appBar: AppBar(
        title: Container(
          child: Text(
            "BETASTORE",
            style: TextStyle(
              fontSize: _scale.labelDim * 2,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                context.go("/profile");
              },
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
          ),
        ],
        backgroundColor: MyGlobal.textColor,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ,Header and SectionText
            Header(ScreenSize: screenSize),
            Center(
                child: SectionText(
              yourText: "Jewelery",
              more: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(
                      category: 'jewelery',
                    ),
                  ),
                );
              },
              textSize: null,
            )),

            // Jewelry Product Grid
            ProductJewery.when(
              data: (products) {
                var twoProducts = products.take(2).toList();

                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: twoProducts.map((product) {
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
                          child: CategoryCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 4, // Adjust card height
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

            Center(
                child: SectionText(
              yourText: 'Men\'s Clothing',
              more: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(
                      category: 'men\'s clothing',
                    ),
                  ),
                );
              },
              textSize: null,
            )),

            ProductMen.when(
              data: (products) {
                var twoProducts = products.take(2).toList();
                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: twoProducts.map((product) {
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
                          child: CategoryCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 4, // Adjust card height
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

            Center(
                child: SectionText(
              yourText: 'Electronics\'s Clothing',
              more: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(
                      category: 'electronics',
                    ),
                  ),
                );
              },
              textSize: null,
            )),

            ProductElectronics.when(
              data: (products) {
                var twoProducts = products.take(2).toList();
                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: twoProducts.map((product) {
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
                          child: CategoryCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 4, // Adjust card height
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

            Center(
                child: SectionText(
              yourText: 'Women\'s clothing',
              more: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(
                      category: 'women\'s clothing',
                    ),
                  ),
                );
              },
              textSize: null,
            )),

            ProductWomen.when(
              data: (products) {
                var twoProducts = products.take(2).toList();
                return Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: twoProducts.map((product) {
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
                          child: CategoryCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 4, // Adjust card height
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

            Center(
                child: SectionText(
              yourText: 'All Products',
              more: () {},
              textSize: null,
            )),

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
                            h: _scale.scaledHeight(0.3),
                            addFunc: () {
                              cartProviderRef.addProduct(product, context);
                            }, // Adjust card height
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
          ],
        ),
      ),
    );
  }
}
