import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/wishlist/wishlist_bloc.dart';

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
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          // Display base on event state.
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (context, index) => Center(
                  child: ProductCard(
                product: state.wishlist.products[index],
                widthFactor: 1.1,
                leftPosition: 100,
                isWishlist: true,
              )),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
