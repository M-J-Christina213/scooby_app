import 'package:flutter/material.dart';

class GroomingDetailPage extends StatelessWidget {
  final Map<String, dynamic> groomer;

  const GroomingDetailPage({super.key, required this.groomer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(groomer['name']),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image
            Container(
              width: double.infinity,
              child: Image.asset(
                groomer['image'],
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
                    groomer['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    groomer['speciality'],
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
                        '${groomer['rating']} (${groomer['reviews']} reviews)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 20, color: Colors.pink),
                      SizedBox(width: 6),
                      Text(
                        groomer['schedule'],
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.pink),
                      SizedBox(width: 6),
                      Text(
                        'Experience: ${groomer['experience']}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.pink),
                      SizedBox(width: 6),
                      Text(
                        'Distance: ${groomer['distance']}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Text(
                    "${groomer['name']} is a professional groomer known for providing top-tier ${groomer['speciality'].toLowerCase()} services. With over ${groomer['experience']} of hands-on experience, they ensure your pets are pampered, stylish, and healthy.\n\nBook now to give your furry friend a spa-like experience!",
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
                    // Add future navigation or booking logic here
                  },
                  icon: Icon(Icons.cut),
                  label: Text("Book Grooming Session"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 255, 177, 245),
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
