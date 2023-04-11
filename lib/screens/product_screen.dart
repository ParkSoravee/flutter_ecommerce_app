import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;
  const ProductScreen({super.key, required this.product});

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9, // make image wider
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy
                  .height, // reduce space between the cards
            ),
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ornare id nibh at venenatis. Pellentesque volutpat nulla sed mauris venenatis varius eu id risus.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ExpansionTile(
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ornare id nibh at venenatis. Pellentesque volutpat nulla sed mauris venenatis varius eu id risus.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
