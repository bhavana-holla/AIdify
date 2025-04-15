import 'package:flutter/material.dart';
import '../models/topic.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Topic topic = ModalRoute.of(context)!.settings.arguments as Topic;

    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Details for ${topic.title}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
