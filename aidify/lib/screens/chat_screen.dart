/*import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/message_input.dart';
import '../services/chat_service.dart';
import '../screens/profile_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;

  void _handleSend() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add(Message(text: userMessage, isUser: true));
      _controller.clear();
      _isLoading = true;
    });

    try {
      final aiReply = await ChatService.sendMessage(userMessage);
      setState(() {
        _messages.add(Message(text: aiReply, isUser: false));
      });
    } catch (e) {
      setState(() {
        _messages.add(Message(text: 'Error: ${e.toString()}', isUser: false));
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEAEA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6E2E2),
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset('assets/images/red_cross_icon.png'),
        ),
        title: const Text(
          'ChatBot',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(message: msg.text, isUser: msg.isUser);
              },
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          MessageInput(
            controller: _controller,
            onSend: _handleSend,
            isLoading: _isLoading,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: const Color.fromRGBO(229, 57, 53, 0.99),
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
    );
  }
}*/
import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/message_input.dart';
import '../services/chat_service.dart';
import '../screens/profile_screen.dart';
import '../screens/home_screen.dart';
import '../screens/bookmark_screen.dart';
import '../screens/message_screen.dart';
import '../screens/call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;

  void _handleSend() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add(Message(text: userMessage, isUser: true));
      _controller.clear();
      _isLoading = true;
    });

    try {
      final aiReply = await ChatService.sendMessage(userMessage);
      setState(() {
        _messages.add(Message(text: aiReply, isUser: false));
      });
    } catch (e) {
      setState(() {
        _messages.add(Message(text: 'Error: ${e.toString()}', isUser: false));
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEAEA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6E2E2),
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset('assets/images/red_cross_icon.png'),
        ),
        title: const Text(
          'ChatBot',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(message: msg.text, isUser: msg.isUser);
              },
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          MessageInput(
            controller: _controller,
            onSend: _handleSend,
            isLoading: _isLoading,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: const Color.fromRGBO(229, 57, 53, 0.99),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.bookmark, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookmarkScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessageScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CallScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
