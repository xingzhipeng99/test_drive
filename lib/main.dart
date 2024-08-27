import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/providers/gift_cart_provider.dart';
import 'package:test_drive/providers/gifts_provider.dart';
import 'package:test_drive/screens/words.dart';
import 'package:test_drive/screens/about.dart';
import 'package:test_drive/screens/albums.dart';
import 'package:test_drive/screens/cart.dart';
import 'package:test_drive/screens/gift_cart.dart';
import 'package:test_drive/screens/index.dart';
import 'package:test_drive/screens/locations.dart';
import 'package:test_drive/screens/gift_detail_screen.dart';
import 'package:test_drive/screens/gift.dart';
import 'package:test_drive/screens/mall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => WordsState()),
        ChangeNotifierProvider(create: (ctx) => GiftsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const IndexScreen(title: 'XZP'),
        routes: <String, WidgetBuilder>{
          MallScreen.routeName: (BuildContext context) => const MallScreen(),
          CartScreen.routeName: (BuildContext context) => const CartScreen(),
          LocationsScreen.routeName: (BuildContext context) =>
              const LocationsScreen(),
          AlbumsScreen.routeName: (BuildContext context) =>
              const AlbumsScreen(),
          GiftScreen.routeName: (context) => const GiftScreen(),
          GiftDetailScreen.routeName: (ctx) => const GiftDetailScreen(),
          GiftCartScreen.routeName: (ctx) => const GiftCartScreen(),
          WordsScreen.routeName: (ctx) => const WordsScreen(title: 'Words'),
          AboutScreen.routeName: (BuildContext context) => const AboutScreen(),
        },
      ),
    );
  }
}
