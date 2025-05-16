/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/firestore_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _dobController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _rhFactorController = TextEditingController();
  final _healthConcernsController = TextEditingController();
  final _addressController = TextEditingController();

  bool _loading = false;

  void _loadProfile() async {
    setState(() => _loading = true);
    final user = await FirestoreService().getUserProfile();
    if (user != null) {
      _usernameController.text = user.username;
      _dobController.text = user.dob;
      _bloodGroupController.text = user.bloodGroup;
      _rhFactorController.text = user.rhFactor;
      _healthConcernsController.text = user.healthConcerns;
      _addressController.text = user.address;
    }
    setState(() => _loading = false);
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final user = UserModel(
      uid: uid,
      username: _usernameController.text,
      dob: _dobController.text,
      bloodGroup: _bloodGroupController.text,
      rhFactor: _rhFactorController.text,
      healthConcerns: _healthConcernsController.text,
      address: _addressController.text,
    );

    setState(() => _loading = true);
    await FirestoreService().saveUserProfile(user);
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated!')),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("Username", _usernameController),
              _buildTextField("Date of Birth", _dobController),
              _buildTextField("Blood Group", _bloodGroupController),
              _buildTextField("Rh Factor", _rhFactorController),
              _buildTextField("Health Concerns", _healthConcernsController),
              _buildTextField("Address", _addressController, lines: 2),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int lines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: lines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/firestore_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _bloodGroupController = TextEditingController();
  final _rhFactorController = TextEditingController();
  final _healthConcernsController = TextEditingController();
  final _addressController = TextEditingController();

  String _username = '';
  String _dob = '';
  bool _loading = true;

  void _loadProfile() async {
    final user = await FirestoreService().getUserProfile();
    if (user != null) {
      setState(() {
        _username = user.username;
        _dob = user.dob;
        _bloodGroupController.text = user.bloodGroup ?? '';
        _rhFactorController.text = user.rhFactor ?? '';
        _healthConcernsController.text = user.healthConcerns ?? '';
        _addressController.text = user.address ?? '';
        _loading = false;
      });
    }
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final updatedUser = UserModel(
      uid: uid,
      username: _username,
      dob: _dob,
      bloodGroup: _bloodGroupController.text.trim(),
      rhFactor: _rhFactorController.text.trim(),
      healthConcerns: _healthConcernsController.text.trim(),
      address: _addressController.text.trim(),
    );

    setState(() => _loading = true);
    await FirestoreService().updateUserProfile(updatedUser);
    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated!')),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildStaticField("Username", _username),
              _buildStaticField("Date of Birth", _dob),
              _buildTextField("Blood Group", _bloodGroupController),
              _buildTextField("Rh Factor", _rhFactorController),
              _buildTextField("Health Concerns", _healthConcernsController),
              _buildTextField("Address", _addressController, lines: 2),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int lines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: lines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }

  Widget _buildStaticField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}




