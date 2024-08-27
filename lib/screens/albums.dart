import 'package:flutter/material.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  static const routeName = '/albums';

  @override
  State<StatefulWidget> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  int refreshedTimes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pull to Refresh'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: Colors.white,
        backgroundColor: Colors.blue,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        items = List.generate(20, (index) => "Refreshed Item ${index + 1}");
        refreshedTimes++;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to refresh: $error'),
      ));
    }
  }
}
