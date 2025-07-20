// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'pet_profile.dart';
import 'login.dart';
import 'pet_owner_data.dart';
import 'services_page.dart';
import 'pet_data.dart'; // ✅ Import pet data

void main() {
  runApp(PetWelfareApp());
}

class PetWelfareApp extends StatelessWidget {
  const PetWelfareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Welfare App',
      theme: ThemeData(
        primaryColor: Color(0xFF9370DB),
        scaffoldBackgroundColor: Color(0xFFE6E6FA),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ServicesPage(),
    DonationAdoptionPage(),
    CommunityPage(),
  ];

  void _onAvatarTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PetOwnerProfilePage()),
    ).then((_) {
      setState(() {}); // Refresh name if profile updated
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = PetOwnerData.name.isNotEmpty ? PetOwnerData.name : "User";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC9A0DC),
        elevation: 0,
        leading: GestureDetector(
          onTap: _onAvatarTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              radius: 20,
            ),
          ),
        ),
        title: Text(
          'Hello, $userName',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFC9A0DC),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donation'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text('Home Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ...PetData.pets.map((pet) => Card(
              color: Color(0xFFF3E5F5),
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(pet.name, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  'Age: ${pet.age} | Height: ${pet.height} cm | Weight: ${pet.weight} kg\n'
                  'Medical: ${pet.medicalHistory}\nMore Info: ${pet.moreInfo}',
                ),
                isThreeLine: true,
              ),
            )),
        if (PetData.pets.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'No pets added yet.\nClick "Add Pet" in profile to get started!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

class DonationAdoptionPage extends StatelessWidget {
  const DonationAdoptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Donation & Adoption Page', style: TextStyle(fontSize: 24)));
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Community Page', style: TextStyle(fontSize: 24)));
  }
}
