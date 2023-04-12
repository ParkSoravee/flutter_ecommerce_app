import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'package:flutter_ecommerce_app/config/theme.dart';

import 'screens/screens.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const HomeScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
