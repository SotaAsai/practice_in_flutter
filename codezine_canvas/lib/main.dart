import 'package:codezine_canvas/line_chart_screen.dart';
import 'package:codezine_canvas/path_combine_screen.dart';
import 'package:codezine_canvas/sample1_screen.dart';
import 'package:codezine_canvas/sample2_screen.dart';
import 'package:codezine_canvas/sample3_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeZine_Canvas',
      theme: ThemeData(),
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Sample1Screen(),
                ),
              );
            },
            child: const Text('Sample1Screen'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Sample2Screen(),
                ),
              );
            },
            child: const Text('Sample2Screen'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Sample3Screen(),
                ),
              );
            },
            child: const Text('Sample3Screen'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LineChartScreen(),
                ),
              );
            },
            child: const Text('LineChartScreen'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const PathCombineScreen(),
                ),
              );
            },
            child: const Text('PathCombineScreen'),
          ),
        ],
      ),
    );
  }
}
