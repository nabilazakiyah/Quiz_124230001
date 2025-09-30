import 'package:flutter_application_1/models/game_data.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameList[index].name),
      ),
      body: Column(
        children: [
          Image.network(gameList[index].imageUrls[0]),
          Text("review : ${gameList[index].reviewAverage}"),
        ],
      ),
    );
  }
}