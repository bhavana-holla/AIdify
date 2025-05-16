import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/logo_image1.png", height: 40),
                      const Icon(Icons.person, size: 28),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.black54),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Emergency Main Contact
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.call, color: Colors.white, size: 28),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EMERGENCY CONTACT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "112",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Emergency Contacts List
                  const Text(
                    "EMERGENCY CONTACTS",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _contactTile(name: "Mom", icon: Icons.call),
                  const SizedBox(height: 8),
                  _contactTile(name: "Dad", icon: Icons.call),
                ],
              ),
            ),

            // Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60,
              child: Container(
                color: Colors.red[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navIcon(
                      icon: Icons.home,
                      onTap: () => Navigator.pushNamed(context, "/home"),
                    ),
                    _navIcon(
                      icon: Icons.bookmark,
                      onTap: () => Navigator.pushNamed(context, "/bookmarks"),
                    ),
                    _navIcon(
                      icon: Icons.message,
                      onTap: () => print("Message tapped"),
                    ),
                    _navIcon(
                      icon: Icons.phone,
                      onTap: () => print("Call tapped"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactTile({required String name, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Icon(icon),
        ],
      ),
    );
  }

  Widget _navIcon({required IconData icon, required VoidCallback onTap}) {
    return IconButton(icon: Icon(icon, color: Colors.white), onPressed: onTap);
  }
}