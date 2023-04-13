import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

import '../bloc/category/category_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero To Unicorn'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9, // make image wider
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy
                        .height, // reduce space between the cards
                    // enableInfiniteScroll: false,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          const SectionTitle(title: 'RECOMMANDED'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          ),
        ],
      ),
    );
  }
}
