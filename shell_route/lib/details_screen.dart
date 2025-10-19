import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    // 下タブを切り替えてもbuildは再実行されてない
    print('DetailScreenのビルド:$label');
    return Center(child: Text('$label Details'));
  }
}
