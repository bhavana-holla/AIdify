class FirstAidTopic {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> steps;

  FirstAidTopic({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.steps,
  });

  factory FirstAidTopic.fromJson(Map<String, dynamic> json) {
    return FirstAidTopic(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      steps: List<String>.from(json['steps']),
    );
  }
}
