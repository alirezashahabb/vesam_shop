import 'package:hive/hive.dart';
import 'package:online_shop/data/model/home_model.dart';

class FavoriteProductManager {
  static final Box<HomeProducts> favoriteProductBox =
      Hive.box<HomeProducts>('favorite_products');
// add Products
  static Future<void> addProduct(HomeProducts products) async {
    await favoriteProductBox.put(
      products.id,
      products,
    );
  }

  // Deleted Products
  static Future<void> deletedProducts(HomeProducts products) async {
    await favoriteProductBox.delete(
      products.id,
    );
  }

// get all products on local dataBase
  static List<HomeProducts> getFavoriteProducts() {
    return favoriteProductBox.values.toList();
  }

//search Products
  static bool isInBox(HomeProducts products) {
    return favoriteProductBox.containsKey(products.id);
  }
}
