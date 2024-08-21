import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/screens/about.dart';
import 'package:test_drive/screens/albums.dart';
import 'package:test_drive/screens/cart_screen.dart';
import 'package:test_drive/screens/locations.dart';
import 'package:test_drive/screens/products.dart';

import '../screens/cart.dart';
import '../screens/product_page.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
            // borderRadius: BorderRadius.zero,
          ),
          child: ListTile(
            onTap: () => Navigator.popAndPushNamed(context, '/profile'),
            leading: const Icon(
              Icons.account_box,
              color: Colors.white,
            ),
            title: const Text(
              'Admin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ListTile(
          onTap: () => Navigator.popAndPushNamed(context, '/'),
          leading: const Icon(
            Icons.home,
            color: Colors.blue,
          ),
          title: const Text('Home'),
        ),
        ListTile(
          onTap: () =>
              Navigator.popAndPushNamed(context, ProductsPage.routeName),
          leading: const Icon(
            Icons.card_giftcard,
            color: Colors.blue,
          ),
          title: const Text('Products'),
        ),
        ListTile(
          onTap: () => {Navigator.popAndPushNamed(context, CartPage.routeName)},
          leading: const Icon(
            Icons.shopping_cart,
            color: Colors.blue,
          ),
          title: const Text('Cart'),
        ),
        ListTile(
          onTap: () =>
              Navigator.popAndPushNamed(context, LocationsPage.routeName),
          leading: const FaIcon(
            FontAwesomeIcons.locationArrow,
            color: Colors.blue,
          ),
          title: const Text('Locations'),
        ),
        ListTile(
          onTap: () => Navigator.popAndPushNamed(context, AlbumsPage.routeName),
          leading: const Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: const Text('Albums'),
        ),
        ListTile(
          onTap: () => Navigator.popAndPushNamed(context, AboutPage.routeName),
          leading: const Icon(
            Icons.info,
            color: Colors.blue,
          ),
          title: const Text('About'),
        ),
        ListTile(
          onTap: () =>
              Navigator.popAndPushNamed(context, ProductPage.routeName),
          leading: const FaIcon(
            FontAwesomeIcons.gift,
            color: Colors.blue,
          ),
          title: const Text('Gifts'),
        ),
        ListTile(
          onTap: () => Navigator.popAndPushNamed(context, CartScreen.routeName),
          leading: const FaIcon(
            FontAwesomeIcons.cartPlus,
            color: Colors.blue,
          ),
          title: const Text('My Gifts'),
        ),
      ],
    );
  }
}
