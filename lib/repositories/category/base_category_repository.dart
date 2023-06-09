// define available function in this repository and which data type that func return

import 'package:flutter_ecommerce_app/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
