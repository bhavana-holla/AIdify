import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/first_aid_topic.dart'; // adjust if your model is in a different folder

Future<List<FirstAidTopic>> loadTopicsFromJson() async {
  final String response = await rootBundle.loadString('assets/data/topics.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => FirstAidTopic.fromJson(json)).toList();
}
