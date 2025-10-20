import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const itemViewHeight = 50.0;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _pairList = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = _ItemFetcher();

  bool _isLoading = true;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadFirst();
  }

  void _loadFirst() {
    _isLoading = true;
    _itemFetcher.fetch().then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _pairList.addAll(fetchedList);
        });
      }
    });
  }

  void _loadMore(double windowHeight) {
    _isLoading = true;
    _itemFetcher.fetchMore(windowHeight).then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _pairList.addAll(fetchedList);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ビルド');
    print('ウィンドウの高さ:${MediaQuery.sizeOf(context).height}');
    return ListView.builder(
      // Need to display a loading tile if more items are coming
      itemCount: _hasMore ? _pairList.length + 1 : _pairList.length,
      itemBuilder: (BuildContext context, int index) {
        // Uncomment the following line to see in real time how ListView.builder works
        // print('ListView.builder is building index $index');
        if (index >= _pairList.length) {
          if (!_isLoading) {
            double windowHeight = MediaQuery.sizeOf(context).height;
            _loadMore(windowHeight);
          }
          return Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SizedBox(
          height: itemViewHeight,
          child: ListTile(
            leading: Text(index.toString(), style: _biggerFont),
            title: Text(_pairList[index].asPascalCase, style: _biggerFont),
          ),
        );
      },
    );
  }
}

class _ItemFetcher {
  final _count = 103;
  final _itemsPerPage = 5;
  int _currentPage = 0;

  // This async function simulates fetching results from Internet, etc.
  Future<List<WordPair>> fetch() async {
    final list = <WordPair>[];

    // double windowHeight = MediaQuery.sizeOf(context).height;
    // print('windowHeight:$windowHeight');

    final n = min(_itemsPerPage, _count - _currentPage * _itemsPerPage);
    // Uncomment the following line to see in real time now items are loaded lazily.
    // print('Now on page $_currentPage');
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        list.add(WordPair.random());
      }
    });
    _currentPage++;
    return list;
  }

  Future<List<WordPair>> fetchMore(double windowHeight) async {
    final list = <WordPair>[];

    final itemsPerPage = windowHeight ~/ itemViewHeight + 5;

    final n = min(itemsPerPage, _count - _currentPage * itemsPerPage);
    // Uncomment the following line to see in real time now items are loaded lazily.
    // print('Now on page $_currentPage');
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        list.add(WordPair.random());
      }
    });
    _currentPage++;
    return list;
  }
}
