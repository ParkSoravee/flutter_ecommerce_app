import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

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
          SizedBox(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9, // make image wider
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy
                    .height, // reduce space between the cards
                enableInfiniteScroll: false,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
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
