import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  final List<String> _allBookmarks = [
    'CPR',
    'Severe Allergies',
    'Burn',
    'Fracture',
  ];
  List<String> _filteredBookmarks = [];
  int _selectedIndex = -1;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredBookmarks = List.from(_allBookmarks);
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredBookmarks =
          _allBookmarks
              .where(
                (bookmark) =>
                    bookmark.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onBookmarkToggle(String title) {
    // Logic to toggle bookmark (you can expand this later)
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Tapped bookmark for $title')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookmarks'),
        backgroundColor: Colors.red.shade100,
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search bookmarks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBookmarks.length,
              itemBuilder: (context, index) {
                final title = _filteredBookmarks[index];
                final isSelected = index == _selectedIndex;

                return ListTile(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.star, color: Colors.black),
                    onPressed: () => _onBookmarkToggle(title),
                  ),
                  tileColor: isSelected ? Colors.grey[300] : null,
                  onTap: () => _onItemTapped(index),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // assuming this is the 2nd tab
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
        ],
        onTap: (index) {
          // Add navigation if needed here
        },
      ),
    );
  }
}
