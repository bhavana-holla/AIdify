import 'package:aidify/screens/bookmark_screen.dart';
import 'package:aidify/screens/call_screen.dart';
import 'package:aidify/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'topic_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(width: 412, height: 917, color: Colors.white),

          // Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              color: Color(0xFFF6E2E2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 12),
                    child: Image.asset(
                      'assets/images/logo_image1.png',
                      height: 49.77,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 15),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ),

          // Search bar
          Positioned(
            top: 135,
            left: 23,
            child: Container(
              width: 320,
              height: 59,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 0, top: 13),
                child: Icon(Icons.search_outlined, size: 30),
              ),
            ),
          ),

          // Scrollable sections
          Positioned(
            top: 225,
            left: 0,
            right: 0,
            bottom: 60,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHorizontalScrollSection(
                    title: "Quick Help",
                    cards: [
                      {"label": "Sprain", "image": "assets/images/sprain.jpg"},
                      {
                        "label": "Snake Bite",
                        "image": "assets/images/snake.png",
                      },
                    ],
                  ),
                  buildHorizontalScrollSection(
                    title: "Circulatory FirstAid",
                    cards: [
                      {"label": "CPR", "image": "assets/images/cpr.png"},
                      {
                        "label": "Cardiac Arrest",
                        "image": "assets/images/cardiac_arrest.png",
                      },
                    ],
                  ),
                  buildHorizontalScrollSection(
                    title: "Respiratory FirstAid",
                    cards: [
                      {
                        "label": "Asthma attack",
                        "image": "assets/images/asthma.png",
                      },
                      {"label": "Choking", "image": "assets/images/snake.png"},
                    ],
                  ),
                  buildHorizontalScrollSection(
                    title: "Other Help",
                    cards: [
                      {"label": "Allergy", "image": "assets/images/sprain.jpg"},
                      {"label": "Burns", "image": "assets/images/burns.png"},
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Container(
              color: Color.fromRGBO(229, 57, 53, 0.99),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookmarksPage()),
                      );
                    },
                    child: Icon(Icons.bookmark, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                    child: Icon(Icons.message, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmergencyScreen()),
                      );
                    },
                    child: Icon(Icons.phone, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalScrollSection({
    required String title,
    required List<Map<String, String>> cards, // Expect image & label
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: const TextStyle(fontFamily: 'Josefin Sans', fontSize: 24),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: BlueCard(
                    imagePath: cards[index]['image']!,
                    label: cards[index]['label']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlueCard extends StatefulWidget {
  final String imagePath;
  final String label;

  const BlueCard({required this.imagePath, required this.label, Key? key})
    : super(key: key);

  @override
  _BlueCardState createState() => _BlueCardState();
}

class _BlueCardState extends State<BlueCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopicDetailScreen(topicLabel: widget.label),
          ),
        );
      },
      child: Container(
        width: 237,
        height: 130,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF8BE6FF), Color(0xFF8BE6FF)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(widget.imagePath, fit: BoxFit.cover),
              ),
            ),
            // Label at the bottom
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontFamily: 'Josefin Sans',
                  fontSize: 18,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
            ),
            // Star at the top right
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorited = !isFavorited;
                  });
                },
                child: Icon(
                  isFavorited ? Icons.star : Icons.star_border,
                  color: isFavorited ? Colors.yellow[700] : Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
