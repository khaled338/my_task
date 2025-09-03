import 'package:my_task_app/core/services/network_service/api_service.dart';
import 'package:my_task_app/core/services/network_service/cashe_services.dart';
import 'package:my_task_app/feature/temp/data/model/product_model.dart';

class ProductsRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      final products = await ApiService.getProducts();
      await CacheService.saveProducts(products); // ✅ حفظ في الكاش
      return products;
    } catch (_) {
      final cached = await CacheService.getProducts();
      if (cached.isNotEmpty) {
        return cached;
      } else {
        throw Exception("فشل تحميل البيانات ولا يوجد نسخة مخزنة محليًا");
      }
    }
  }
}