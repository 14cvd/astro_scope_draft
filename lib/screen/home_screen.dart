import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 60,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          if (index < 0 || index > 8) {
            return null;
          }
          return ListTile(
            leading: Text(
              "item$index",
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
            title: Text("Title $index"),
            subtitle: const Text('Description here'),
          );
        },
      ),
    );
  }
}
