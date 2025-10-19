import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.label, required this.detailsPath});
  
  final String label;
  final String detailsPath;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.go(detailsPath),
        child: Text('Go to $label Details'),
      ),
    );
  }
}
