import 'package:flutter/material.dart';
import 'add_pet.dart';
import 'pet_owner_data.dart'; // Import the shared data

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
      SnackBar(content: Text('Profile saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF9370DB),
        title: Text("Pet Owner Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFE6E6FA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pet Owner Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildTextField("Name", _nameController),
                SizedBox(height: 10),
                _buildTextField("Contact Number", _contactController),
                SizedBox(height: 10),
                _buildTextField("Email", _emailController),
                SizedBox(height: 10),
                _buildTextField("Address", _addressController),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("Save", const Color.fromRGBO(166, 133, 255, 1), _saveProfile),
                    _buildButton("Edit", Color.fromRGBO(166, 133, 255, 1), () {
                      print("Edit profile tapped");
                    }),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPetScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA685FF),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text("Add Pet"),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text),
    );
  }
}
