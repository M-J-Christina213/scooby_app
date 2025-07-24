main.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'pet_profile.dart';
import 'login.dart';
import 'pet_owner_data.dart';
import 'services_page.dart';
import 'pet_data.dart';

void main() {
  runApp(const PetWelfareApp());
}

class PetWelfareApp extends StatelessWidget {
  const PetWelfareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Welfare App',
      theme: ThemeData(
        primaryColor: const Color(0xFF9370DB),
        scaffoldBackgroundColor: const Color(0xFFE6E6FA),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
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

  List<Widget> get _pages => [
        const HomePage(),
        const ServicesPage(),
        const DonationAdoptionPage(),
        const CommunityPage(),
      ];

  void _onAvatarTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PetOwnerProfilePage()),
    ).then((_) {
      setState(() {}); // Refresh after coming back from profile
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = PetOwnerData.name.isNotEmpty ? PetOwnerData.name : "User";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC9A0DC),
        elevation: 0,
        leading: GestureDetector(
          onTap: _onAvatarTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
          ),
        ),
        title: Text(
          'Hello, $userName',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFC9A0DC),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donation'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {}); // Refresh when navigating back
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Home Page', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        if (PetData.pets.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'No pets added yet.\nClick "Add Pet" in profile to get started!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ...PetData.pets.map((pet) => Card(
              color: const Color(0xFFF3E5F5),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(pet.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  'Age: ${pet.age} | Height: ${pet.height} cm | Weight: ${pet.weight} kg\n'
                  'Medical: ${pet.medicalHistory}\nMore Info: ${pet.moreInfo}',
                ),
                isThreeLine: true,
              ),
            )),
      ],
    );
  }
}

class DonationAdoptionPage extends StatelessWidget {
  const DonationAdoptionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Donation & Adoption Page', style: TextStyle(fontSize: 24)));
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Community Page', style: TextStyle(fontSize: 24)));
  }
}