import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.4,
        ),
        itemCount: Product.products.length,
        itemBuilder: (context, index) => Center(
            child: ProductCard(
          product: Product.products[index],
          widthFactor: 1.1,
          leftPosition: 100,
          isWishlist: true,
        )),
      ),
    );
  }
}
