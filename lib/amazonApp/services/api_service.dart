import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gr_analysis/ui/model/model.dart';

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

class ApiServices {
  Future<Suggestions> getSuggestions() async {
    try {
      final res = await Dio().get('https://bored-api.appbrewery.com/random');
      return Suggestions.fromJson(res.data);
    } catch (error) {
      throw Exception("error while fetching Results ");
    }
  }
}