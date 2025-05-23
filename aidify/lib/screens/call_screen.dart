import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EmergencyContactsApp());
}

class EmergencyContactsApp extends StatelessWidget {
  const EmergencyContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Contacts',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const EmergencyContactsScreen(),
    );
  }
}

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<EmergencyContact> contacts = [
    EmergencyContact(name: 'Universal Emergency', number: '112'),
    EmergencyContact(name: 'MOM', number: ''), // Add actual number
    EmergencyContact(name: 'DAD', number: ''), // Add actual number
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _addNewContact() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Emergency Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Contact Name',
                  hintText: 'e.g., Doctor',
                ),
              ),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'e.g., +1234567890',
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && numberController.text.isNotEmpty) {
                  setState(() {
                    contacts.add(EmergencyContact(
                      name: nameController.text,
                      number: numberController.text,
                    ));
                    nameController.clear();
                    numberController.clear();
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewContact,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: contact.number.isNotEmpty
                  ? Text(contact.number)
                  : const Text('Number not set', style: TextStyle(color: Colors.red)),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.red),
                onPressed: contact.number.isNotEmpty
                    ? () => makePhoneCall(contact.number)
                    : null,
              ),
              onTap: contact.number.isNotEmpty
                  ? () => makePhoneCall(contact.number)
                  : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewContact,
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class EmergencyContact {
  final String name;
  final String number;

  EmergencyContact({required this.name, required this.number});
}