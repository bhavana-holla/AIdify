import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TopicDetailScreen extends StatefulWidget {
  final String topicLabel;

  const TopicDetailScreen({required this.topicLabel, Key? key}) : super(key: key);

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> with SingleTickerProviderStateMixin {
  String topicContent = '';
  String? imageUrl;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    loadTopicData();
  }

  Future<void> loadTopicData() async {
    final String jsonString = await rootBundle.loadString('assets/data/topics.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    final topic = jsonList.firstWhere(
      (item) => item['title'] == widget.topicLabel,
      orElse: () => null,
    );

    setState(() {
      topicContent = topic != null
          ? topic['description'] ?? 'Content not available.'
          : 'Content not available.';
      imageUrl = topic != null ? topic['image'] : null;
      _visible = false;
    });

    // Delay to allow the widget to build before animating
    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) {
      setState(() {
        _visible = true;
      });
    }
  }

  List<Widget> _buildSteps(String description) {
    final steps = description.split(RegExp(r'\n\d+\.')).where((s) => s.trim().isNotEmpty).toList();
    // If the split doesn't work (no numbered steps), fallback to splitting by \n
    if (steps.length <= 1) {
      return description
          .split('\n')
          .where((s) => s.trim().isNotEmpty)
          .map((step) => _buildStepTile(step))
          .toList();
    }
    return steps.map((step) => _buildStepTile(step)).toList();
  }

  Widget _buildStepTile(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 20, color: Colors.red)),
          Expanded(
            child: Text(
              step.trim(),
              style: const TextStyle(fontSize: 17, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicLabel),
        backgroundColor: const Color.fromRGBO(229, 57, 53, 0.99),
        elevation: 2,
      ),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : const Offset(0, 0.1),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image placeholder or actual image
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: imageUrl != null
                              ? Image.asset(
                                  imageUrl!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 140,
                                  width: double.infinity,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.medical_services, size: 60, color: Colors.redAccent),
                                ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Steps:",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800],
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._buildSteps(topicContent),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
