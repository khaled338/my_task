import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_task_app/feature/temp/data/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const _key = "products";

  /// ✅ حفظ المنتجات + الصور في الكاش
  static Future<void> saveProducts(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> data = [];

    for (var product in products) {
      String? base64Image;

      try {
        // تحميل الصورة كـ bytes
        final response = await http.get(Uri.parse(product.image));
        if (response.statusCode == 200) {
          base64Image = base64Encode(response.bodyBytes);
        }
      } catch (_) {
        base64Image = null;
      }

      // نحفظ المنتج مع الصورة المكاشية
      final productJson = product.toJson();
      productJson['cachedImage'] = base64Image;

      data.add(productJson);
    }

    await prefs.setString(_key, jsonEncode(data));
  }

  /// ✅ استرجاع المنتجات من الكاش
  static Future<List<Product>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data != null) {
      List decoded = jsonDecode(data);

      return decoded.map((e) {
        final product = Product.fromJson(e);

        // لو الصورة مكاشية، نخزنها في الـ model
        if (e['cachedImage'] != null) {
          product.cachedImage = e['cachedImage'];
        }

        return product;
      }).toList();
    }

    return [];
  }
}
