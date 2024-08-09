import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            "data1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "data2",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "data3",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "data4",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "data5",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "data6",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
