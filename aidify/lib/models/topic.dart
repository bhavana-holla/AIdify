class Topic {
  final String id;
  final String title;
  final String imagePath;

  Topic({required this.id, required this.title, required this.imagePath});
}

final dummyTopics = [
  Topic(id: '1', title: 'Burns', imagePath: 'assets/images/burns.png'),
  Topic(id: '2', title: 'Fractures', imagePath: 'assets/images/fractures.png'),
  Topic(id: '3', title: 'CPR', imagePath: 'assets/images/cpr.png'),
  Topic(id: '4', title: 'Choking', imagePath: 'assets/images/choking.png'),
];
