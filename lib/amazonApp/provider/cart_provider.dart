import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct<List>(Product product) {
    state = state.where((p) => p != product).toList();
  }

  double get totalPrice {
    return state.fold(0, (total, current) => total + (current.price * 1));
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>((ref) {
  return CartStateNotifier();
});
