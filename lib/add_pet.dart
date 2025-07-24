import 'package:flutter/material.dart';
import 'pet_data.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final medicalHistoryController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final moreInfoController = TextEditingController();

  void _handleEdit() {
    final newPet = Pet(
      name: nameController.text,
      age: int.tryParse(ageController.text) ?? 0,
      medicalHistory: medicalHistoryController.text,
      height: double.tryParse(heightController.text) ?? 0.0,
      weight: double.tryParse(weightController.text) ?? 0.0,
      moreInfo: moreInfoController.text,
    );

    PetData.pets.insert(0, newPet);
('Pet added: ${newPet.name}');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Add Pet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildTextField('Name', nameController),
                _buildTextField('Age', ageController, TextInputType.number),
                _buildTextField('Medical History', medicalHistoryController),
                _buildTextField('Height (cm)', heightController, TextInputType.number),
                _buildTextField('Weight (kg)', weightController, TextInputType.number),
                _buildTextField('More Info', moreInfoController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleEdit,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
                  child: const Text('Save Pet'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, [TextInputType type = TextInputType.text]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}