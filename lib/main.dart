import 'package:flutter/material.dart';
import 'pet_profile.dart';
import 'login.dart';
import 'pet_owner_data.dart'; 
import 'services_page.dart'; 

void main() {
  runApp(PetWelfareApp());
}

class PetWelfareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Welfare App',
      theme: ThemeData(
        primaryColor: Color(0xFF9370DB),
        scaffoldBackgroundColor: Color(0xFFE6E6FA),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Can change to MainPage() if login not ready
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ServicesPage(), // ✅ Using the real one from services_page.dart
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
    return Center(child: Text('Home Page', style: TextStyle(fontSize: 24)));
  }
}

class DonationAdoptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Donation & Adoption Page', style: TextStyle(fontSize: 24)));
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Community Page', style: TextStyle(fontSize: 24)));
  }
}
