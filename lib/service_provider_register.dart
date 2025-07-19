import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ServiceProviderRegisterScreen extends StatefulWidget {
  const ServiceProviderRegisterScreen({super.key});

  @override
  State<ServiceProviderRegisterScreen> createState() => _ServiceProviderRegisterScreenState();
}

class _ServiceProviderRegisterScreenState extends State<ServiceProviderRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;

  Future<void> _pickFile() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Registration Sent"),
          content: const Text(
            "Your registration is sent to admin. You will be given access after confirmation.",
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
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
        title: const Text('Service Provider Registration'),
        backgroundColor: const Color.fromARGB(255, 164, 135, 214),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Register as Service Provider',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 20),
                _buildTextField('Name', Icons.person, TextInputType.name),
                const SizedBox(height: 20),
                _buildTextField('Email', Icons.email, TextInputType.emailAddress),
                const SizedBox(height: 20),
                _buildTextField('Password', Icons.lock, TextInputType.text, isPassword: true),
                const SizedBox(height: 20),
                _buildMultilineField('Qualification', Icons.school),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload Document'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 159, 218),
                  ),
                ),
                if (_selectedFile != null) ...[
                  const SizedBox(height: 10),
                  Text("Selected file: ${_selectedFile!.path.split('/').last}"),
                ],
                const SizedBox(height: 20),
                _buildMultilineField('Experience', Icons.work),
                const SizedBox(height: 20),
                _buildMultilineField('More About You', Icons.info_outline),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showConfirmationDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 172, 241),
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextInputType inputType, {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildMultilineField(String label, IconData icon) {
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
