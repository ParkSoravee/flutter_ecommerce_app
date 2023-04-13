import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/category/category_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'package:flutter_ecommerce_app/config/theme.dart';

import 'repositories/category/category_repository.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
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
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
