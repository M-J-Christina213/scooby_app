import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VeterinarianScreen extends StatefulWidget {
  const VeterinarianScreen({super.key});

  @override
  State<VeterinarianScreen> createState() => _VeterinarianScreenState();
}

class _VeterinarianScreenState extends State<VeterinarianScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  void _saveDetails() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veterinarian details saved!')),
      );

      'Name: ${_nameController.text}';
      'Description: ${_descController.text}';
      'Price: ${_priceController.text}';
      'Image path: ${_image?.path}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veterinarian Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                        height: 150,
                        width: 150,
                        color: Colors.grey[300],
                        child: const Center(child: Text('Upload Image')),
                      )
                    : Image.file(_image!, height: 150, width: 150, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? 'Enter description' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter price' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveDetails,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
