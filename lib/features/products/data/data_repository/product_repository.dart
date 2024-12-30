import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:infoware_flutter_assignment/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> fetchProducts() async {
    DateTime st = DateTime.now();

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final DateTime endTime = DateTime.now();
      final Duration duration = endTime.difference(st);
      log('API call duration: ${duration.inMilliseconds} ms');

      final List<dynamic> jsonResponse = json.decode(response.body);

      final list = jsonResponse.map((product) => ProductModel.fromJson(product)).toList();

      return list;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
