import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products.dart';
import '../services/api_service.dart';

final ProductFutureProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProducts();
});
final productJeweleryProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryJewelery();
});
final productProvider = FutureProvider.family<Product, int>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProductById(id);
});
