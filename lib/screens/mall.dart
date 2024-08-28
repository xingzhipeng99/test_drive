import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

// https://www.dhiwise.com/post/flutter-pull-to-refresh-how-to-implement-customize
// https://www.dhiwise.com/post/infinite-list-in-flutter-scroll-more-load-less
class MallScreen extends StatefulWidget {
  const MallScreen({super.key});

  static const routeName = '/mall';

  @override
  State<MallScreen> createState() => _MallScreenState();
}

class _MallScreenState extends State<MallScreen> {
  final _scrollController = ScrollController();
  final _list = <Product>[];
  int _currentPage = 1;
  final int _pageSize = 20;
  bool _isLoading = false;
  int total = 0;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchData(_currentPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int page) async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      int skip = (_currentPage - 1) * _pageSize;
      final response = await http.get(Uri.parse(
          'https://dummyjson.com/products?limit=$_pageSize&skip=$skip'));
      if (response.statusCode == 200) {
        setState(() {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          total = jsonResponse['total'];
          var products = jsonResponse['products'];
          for (var product in products) {
            _list.add(Product.fromJson(product));
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      setState(() {
        _currentPage++;
        _fetchData(_currentPage);
      });
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _currentPage = 1;
      _list.clear();
      _fetchData(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mall'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: Colors.white,
        backgroundColor: Colors.blue,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                mainAxisSpacing: 2,
              ),
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: _list.length + (_isLoading ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (index == _list.length) {
                  return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ]);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            color: Colors.grey,
                            alignment: Alignment.center,
                            child: Image.network(
                              _list[index].thumbnail,
                              width: 100,
                              height: 100,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    _list[index].title,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "\$ ${_list[index].price.toString()}",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    for (var tag in _list[index].tags)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Chip(
                                          elevation: 2,
                                          padding: const EdgeInsets.all(4),
                                          backgroundColor:
                                              Colors.greenAccent[100],
                                          shadowColor: Colors.black,
                                          label: Text(tag),
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  _list[index].description,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

// https://stackoverflow.com/questions/50441168/iterating-through-a-list-to-render-multiple-widgets-in-flutter
Widget getProductTags(List<String> tags) {
  return Row(
    children: tags
        .map(
          (tag) => Padding(
            padding: const EdgeInsets.only(
              right: 8,
              bottom: 8,
            ),
            child: Chip(
              elevation: 20,
              padding: const EdgeInsets.all(4),
              backgroundColor: Colors.greenAccent[100],
              shadowColor: Colors.black,
              label: Text(tag),
            ),
          ),
        )
        .toList(),
  );
}
