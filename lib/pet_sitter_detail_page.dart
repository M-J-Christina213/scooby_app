import 'package:flutter/material.dart';
import 'pet_owner_data.dart'; // To access pet owner's name

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
                    final ownerName = PetOwnerData.name;

                    final now = DateTime.now();
                    final bookingTime = '${now.day}/${now.month}/${now.year} at ${now.hour}:${now.minute.toString().padLeft(2, '0')}';

                    final appointmentDateTime = DateTime(now.year, now.month, now.day + 1, 9, 0);
                    final appointmentTime = '${appointmentDateTime.day}/${appointmentDateTime.month}/${appointmentDateTime.year} at 9:00 AM';

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        title: const Text("Booking Confirmed!"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("✅ Your booking was successful."),
                            const SizedBox(height: 10),
                            Text("👤 Pet Owner: $ownerName"),
                            Text("📅 Booked On: $bookingTime"),
                            Text("📍 Appointment: $appointmentTime"),
                            const Text("💰 Amount: LKR 2000"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK", style: TextStyle(color: Colors.teal)),
                          ),
                        ],
                      ),
                    );
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
