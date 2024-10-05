

import '../model/products.dart';


final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

class ApiServices {
  Future<Product> getSuggestions() async {
    try {
      final res = await Dio().get('https://bored-api.appbrewery.com/random');
      return Product.fromJson(res.data);
    } catch (error) {
      throw Exception("error while fetching Results ");
    }
  }
}