import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.label});
  
  final String label;
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$label Details'));
  }
}
