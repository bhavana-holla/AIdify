import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TopicDetailScreen extends StatefulWidget {
  final String topicLabel;

  const TopicDetailScreen({required this.topicLabel, Key? key}) : super(key: key);

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  String topicContent = '';

  @override
  void initState() {
    super.initState();
    loadTopicData();
  }

  Future<void> loadTopicData() async {
    final String jsonString = await rootBundle.loadString('assets/data/topics.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    setState(() {
      topicContent = jsonMap[widget.topicLabel] ?? 'Content not available.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicLabel),
        backgroundColor: const Color.fromRGBO(229, 57, 53, 0.99),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          topicContent,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
