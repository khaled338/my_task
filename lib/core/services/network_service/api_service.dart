// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_task_app/feature/temp/data/model/product_model.dart';

class ApiService {
  static const String baseUrl = "https://kadymart.com/wp-json/wc/v3";
  static const String consumerKey = "ck_601f6f663f23922ee4d2e1da0d77991342198c1e";
  static const String consumerSecret = "cs_a2aab65f248cef03197295ff87a7b4e55997e8c2";

  /// request عام
  static Future<http.Response> getRequest(String endpoint,
      {Map<String, String>? queryParams}) async {
    final params = {
      "consumer_key": consumerKey,
      "consumer_secret": consumerSecret,
      ...?queryParams,
    };

    final uri =
        Uri.parse("$baseUrl/$endpoint").replace(queryParameters: params);

    return await http.get(uri);
  }

  /// ✅ جلب المنتجات
  static Future<List<Product>> getProducts({int? categoryId}) async {
    final response = await getRequest("products", queryParams: {
      if (categoryId != null) "category": categoryId.toString(),
      "per_page": "20",
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("فشل تحميل المنتجات");
    }
  }

  /// ✅ البحث عن المنتجات
  static Future<List<Product>> searchProducts(String query) async {
    final response = await getRequest("products", queryParams: {
      "search": query,
      "per_page": "20",
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("فشل البحث عن المنتجات");
    }
  }
  
}