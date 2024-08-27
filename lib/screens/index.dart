import 'package:flutter/material.dart';

import '../widgets/app_menu.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key, required this.title});

  final String title;

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    // var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        // leading: const IconButton(
        //   icon: Icon(Icons.menu),
        //   tooltip: 'Navigation menu',
        //   onPressed: null,
        // ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: AppMenu(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return const Column(
            children: [],
          );
        },
      ),
    );
  }
}
