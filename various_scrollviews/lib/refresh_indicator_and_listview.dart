import 'package:flutter/material.dart';

class RefreshIndicatorAndListView extends StatefulWidget {
  const RefreshIndicatorAndListView({super.key});

  @override
  State<RefreshIndicatorAndListView> createState() => _RefreshIndicatorAndListViewState();
}

class _RefreshIndicatorAndListViewState extends State<RefreshIndicatorAndListView> {
  List<String> _items = List.generate(
    10,
    (index) => 'Initial Item ${index + 1}',
  );

  Future<void> _handleRefresh() async {
    // Simulate a network request or data fetching delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      // Update the list with new data
      _items = List.generate(10, (index) => 'Refreshed Item ${index + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to Refresh Example')),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(_items[index]));
          },
        ),
      ),
    );
  }
}
