import 'package:flutter/material.dart';

class PetSitterDetailPage extends StatelessWidget {
  final Map<String, dynamic> sitter;

  const PetSitterDetailPage({super.key, required this.sitter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(sitter['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image
            Container(
              width: double.infinity,
              child: Image.asset(
                sitter['image'],
                height: 240,
                fit: BoxFit.cover,
              ),
            ),

            // Detail card
            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sitter['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    sitter['speciality'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${sitter['rating']} (${sitter['reviews']} reviews)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 20, color: Colors.teal),
                      SizedBox(width: 6),
                      Text(
                        sitter['schedule'],
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.teal),
                      SizedBox(width: 6),
                      Text(
                        'Experience: ${sitter['experience']}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.teal),
                      SizedBox(width: 6),
                      Text(
                        'Distance: ${sitter['distance']}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Text(
                    "${sitter['name']} is a highly trusted pet sitter offering ${sitter['speciality'].toLowerCase()} for your furry friends. With ${sitter['experience']} of dedication, they provide a safe and loving environment for pets when you're away.\n\nBook now for peace of mind!",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),

            // Book Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Booking functionality here
                  },
                  icon: Icon(Icons.calendar_today),
                  label: Text("Book an Appointment"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
