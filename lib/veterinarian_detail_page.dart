import 'package:flutter/material.dart';
import 'pet_owner_data.dart'; // Make sure this exists

class VeterinarianDetailPage extends StatelessWidget {
  final Map<String, dynamic> vet;

  const VeterinarianDetailPage({super.key, required this.vet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(vet['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                vet['image'],
                height: 240,
                fit: BoxFit.cover,
              ),
            ),

            // Detail Card
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
                    vet['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    vet['qualification'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${vet['rating']} (${vet['reviews']} reviews)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 20, color: Colors.deepPurple),
                      SizedBox(width: 6),
                      Text(
                        vet['schedule'],
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.monetization_on, color: Colors.green),
                      SizedBox(width: 6),
                      Text(
                        '1000 LKR for an Appointment',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.deepPurple),
                      SizedBox(width: 6),
                      Text(
                        'PetVet Clinic',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Dr. ${vet['name'].split(' ')[1]}, one of the most skilled and experienced veterinarians and the owner of the most convenient animal clinic 'Petz & Vetz'. Our paradise is situated in the heart of the town with a pleasant environment. We are ready to treat your beloved doggos & puppers with love and nourishment.\n\nBook the appointment now!",
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
                            Text("✅ Your appointment was successfully booked."),
                            const SizedBox(height: 10),
                            Text("👤 Pet Owner: $ownerName"),
                            Text("📅 Booked On: $bookingTime"),
                            Text("📍 Appointment: $appointmentTime"),
                            const Text("💰 Fee: LKR 1000"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK", style: TextStyle(color: Colors.deepPurpleAccent)),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.calendar_today),
                  label: Text("Book an Appointment"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 240, 77, 255),
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
