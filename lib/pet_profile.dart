// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'add_pet.dart';
import 'pet_owner_data.dart';

class PetOwnerProfilePage extends StatefulWidget {
  const PetOwnerProfilePage({super.key});

  @override
  _PetOwnerProfilePageState createState() => _PetOwnerProfilePageState();
}

class _PetOwnerProfilePageState extends State<PetOwnerProfilePage> {
  final _nameController = TextEditingController(text: PetOwnerData.name);
  final _contactController = TextEditingController(text: PetOwnerData.contact);
  final _emailController = TextEditingController(text: PetOwnerData.email);
  final _addressController = TextEditingController(text: PetOwnerData.address);

  void _saveProfile() {
    setState(() {
      PetOwnerData.name = _nameController.text;
      PetOwnerData.contact = _contactController.text;
      PetOwnerData.email = _emailController.text;
      PetOwnerData.address = _addressController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully')),
    );
  }

  Future<void> _navigateToAddPet() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPetScreen()),
    );

    if (result == true) {
      // Pet added, return to main page and trigger refresh
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9370DB),
        title: const Text("Pet Owner Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6FA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pet Owner Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTextField("Name", _nameController),
                const SizedBox(height: 10),
                _buildTextField("Contact Number", _contactController),
                const SizedBox(height: 10),
                _buildTextField("Email", _emailController),
                const SizedBox(height: 10),
                _buildTextField("Address", _addressController),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("Save", const Color(0xFFA685FF), _saveProfile),
                    _buildButton("Edit", const Color(0xFFA685FF), () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit profile tapped')),
                      );
                    }),
                    ElevatedButton(
                      onPressed: _navigateToAddPet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA685FF),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Add Pet"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text),
    );
  }
}