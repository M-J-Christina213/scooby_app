import 'package:flutter/material.dart';

void main() {
  runApp(const AddPetApp());
}

class AddPetApp extends StatelessWidget {
  const AddPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Pet',
      debugShowCheckedModeBanner: false,
      home: AddPetScreen(),
    );
  }
}

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController medicalHistoryController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController moreInfoController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    medicalHistoryController.dispose();
    heightController.dispose();
    weightController.dispose();
    moreInfoController.dispose();
    super.dispose();
  }

  void _handleEdit() {
    // Example logic
    'Name: ${nameController.text}';
    'Age: ${ageController.text}';
    'Medical History: ${medicalHistoryController.text}';
    'Height: ${heightController.text}';
    'Weight: ${weightController.text}';
    'More Info: ${moreInfoController.text}';

    // Add form validation or submission logic here
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
                const Text(
                  'Add Pet',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(label: 'Name', controller: nameController),
                _buildTextField(label: 'Age', controller: ageController, keyboardType: TextInputType.number),
                _buildTextField(label: 'Medical History', controller: medicalHistoryController),
                _buildTextField(label: 'Height (cm)', controller: heightController, keyboardType: TextInputType.number),
                _buildTextField(label: 'Weight (kg)', controller: weightController, keyboardType: TextInputType.number),
                _buildTextField(label: 'More Info', controller: moreInfoController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleEdit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('Edit', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
