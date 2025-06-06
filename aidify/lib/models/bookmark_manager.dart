import 'package:flutter/material.dart';

class BookmarkManager extends ChangeNotifier {
  static final BookmarkManager _instance = BookmarkManager._internal();
  factory BookmarkManager() => _instance;

  final Set<String> _bookmarkedLabels = {};

  BookmarkManager._internal();

  bool isBookmarked(String label) => _bookmarkedLabels.contains(label);

  void addBookmark(String label) {
    _bookmarkedLabels.add(label);
    notifyListeners();
  }

  Future<void> removeBookmark(BuildContext context, String label) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Bookmark?'),
        content: Text('Are you sure you want to remove "$label" from your bookmarks?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Remove')),
        ],
      ),
    );
    if (confirm == true) {
      _bookmarkedLabels.remove(label);
      notifyListeners();
    }
  }

  List<String> getBookmarks() => _bookmarkedLabels.toList();
}
