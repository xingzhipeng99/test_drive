import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/screens/words.dart';
import 'package:test_drive/screens/about.dart';
import 'package:test_drive/screens/albums.dart';
import 'package:test_drive/screens/gift_cart.dart';
import 'package:test_drive/screens/locations.dart';
import 'package:test_drive/screens/mall.dart';

import '../screens/cart.dart';
import '../screens/feed.dart';
import '../screens/gift.dart';

class AppMenuItem {
  final String route;
  final Widget title;
  final IconData iconData;
  final Color iconColor;

  const AppMenuItem({
    required this.route,
    required this.title,
    required this.iconData,
    required this.iconColor,
  });
}

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  // final String userProfile = 'assets/images/icons/User_Profile.svg';

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      'images/icons/User_Profile.svg',
      semanticsLabel: 'User Profile',
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
    List<AppMenuItem> list = <AppMenuItem>[
      const AppMenuItem(
        route: '/',
        title: Text('Home'),
        iconData: Icons.home,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: MallScreen.routeName,
        title: Text('Mall'),
        iconData: Icons.local_mall,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: CartScreen.routeName,
        title: Text('Cart'),
        iconData: Icons.shopping_cart,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: LocationsScreen.routeName,
        title: Text('Locations'),
        iconData: FontAwesomeIcons.locationArrow,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: AlbumsScreen.routeName,
        title: Text('Albums'),
        iconData: Icons.photo_album,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: GiftScreen.routeName,
        title: Text('Gifts'),
        iconData: FontAwesomeIcons.gift,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: GiftCartScreen.routeName,
        title: Text('My Gifts'),
        iconData: FontAwesomeIcons.cartPlus,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: WordsScreen.routeName,
        title: Text('Words'),
        iconData: Icons.wordpress,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: FeedScreen.routeName,
        title: Text('Feeds'),
        iconData: Icons.feed,
        iconColor: Colors.blue,
      ),
      const AppMenuItem(
        route: AboutScreen.routeName,
        title: Text('About'),
        iconData: Icons.info,
        iconColor: Colors.blue,
      ),
    ];
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
            // borderRadius: BorderRadius.zero,
          ),
          child: ListTile(
            onTap: () => Navigator.popAndPushNamed(context, '/profile'),
            leading: svg,
            // leading: const Icon(
            //   Icons.account_box,
            //   color: Colors.white,
            // ),
            title: const Text(
              'Admin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ...List.generate(
          list.length,
          (index) {
            return ListTile(
              onTap: () =>
                  Navigator.popAndPushNamed(context, list[index].route),
              leading: Icon(
                list[index].iconData,
                color: list[index].iconColor,
              ),
              title: list[index].title,
            );
          },
        ),
      ],
    );
  }
}
