import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: 412,
            height: 917,
            color: Colors.white,
          ),

          // Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 69,
            child: Container(
              color: Color(0xFFF6E2E2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Image.asset(
                      'assets/images/logo_image1.png',
                      height: 49.77,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 10),
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
              width: 363,
              height: 59,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 13),
                child: Icon(Icons.search_outlined, size: 32),
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
                    cards: ["Sprain", "Snake bite"],
                  ),
                  buildHorizontalScrollSection(
                    title: "Circulatory FirstAid",
                    cards: ["CPR", "Cardiac Arrest"],
                  ),
                  buildHorizontalScrollSection(
                    title: "Respiratory FirstAid",
                    cards: ["Asthama Attack", "Choking"],
                  ),
                  buildHorizontalScrollSection(
                    title: "Other Help",
                    cards: ["Allergy", "Burns"],
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
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.bookmark, color: Colors.white),
                  Icon(Icons.message, color: Colors.white),
                  Icon(Icons.phone, color: Colors.white),
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
    required List<String> cards,
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
              style: const TextStyle(
                fontFamily: 'Josefin Sans',
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 237,
                  height: 101,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF8BE6FF),
                      Color(0xFF8BE6FF),
                    ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      cards[index],
                      style: const TextStyle(
                        fontFamily: 'Josefin Sans',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
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
