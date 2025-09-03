import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final double regular_price;
  final double sale_price;
  final String description;
  RxBool isFavorite = false.obs;
  String? cachedImage;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.regular_price,
    required this.sale_price,
    required this.description,
    this.cachedImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      regular_price:
          double.tryParse(json['regular_price'].toString()) ?? 0.0,
      sale_price: double.tryParse(json['sale_price'].toString()) ?? 0.0,
      description: json['description'] ?? '',
      image: (json['images'] != null && json['images'].isNotEmpty)
          ? json['images'][0]['src']
          : '',
          cachedImage: json['cachedImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'regular_price': regular_price,
      'sale_price': sale_price,
      'description': description,
      'image': image,
      "cachedImage": cachedImage, 
    };
  }
}