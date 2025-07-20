import 'package:flutter/material.dart';

class VeterinarianDetailPage extends StatelessWidget {
  final Map<String, dynamic> vet;

  const VeterinarianDetailPage({super.key, required this.vet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vet['name']),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(vet['image']),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(vet['qualification'], style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text('${vet['rating']} (${vet['reviews']} reviews)'),
              ],
            ),
            SizedBox(height: 16),
            Text('Experience: ${vet['experience']}'),
            Text('Distance: ${vet['distance']}'),
            Text('Available: ${vet['schedule']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Future appointment or contact action
              },
              child: Text("Book Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
