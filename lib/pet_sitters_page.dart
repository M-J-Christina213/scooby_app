import 'package:flutter/material.dart';

class PetSittersPage extends StatelessWidget {
  final List<Map<String, String>> petSitterServices = [
    {
      'name': 'Daily Visit',
      'description': 'Sitter visits your home once daily for pet care.',
      'price': 'LKR 1500',
    },
    {
      'name': 'Overnight Stay',
      'description': 'Sitter stays overnight to ensure complete care.',
      'price': 'LKR 4000',
    },
    {
      'name': 'Weekend Care',
      'description': 'Extended sitting over the weekend.',
      'price': 'LKR 6000',
    },
  ];

   PetSittersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pet Sitters Services')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: petSitterServices.length,
        itemBuilder: (context, index) {
          final service = petSitterServices[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.pets),
              title: Text(service['name']!),
              subtitle: Text(service['description']!),
              trailing: Text(service['price']!),
            ),
          );
        },
      ),
    );
  }
}
