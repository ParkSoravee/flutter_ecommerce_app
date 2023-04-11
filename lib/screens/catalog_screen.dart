import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';

import '../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category category;
  const CatalogScreen({
    super.key,
    required this.category,
  });

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(),
      body: Container(),
    );
  }
}
