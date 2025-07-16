import 'package:flutter/material.dart';
import 'login.dart';  // import your LoginScreen

void main() {
  runApp(PetWelfareApp());
}

class PetWelfareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Welfare App',
      theme: ThemeData(
        primaryColor: Color(0xFF9370DB), // medium purple
        scaffoldBackgroundColor: Color(0xFFE6E6FA), // lavender background
      ),
       debugShowCheckedModeBanner: false,
      home: LoginScreen(), // <- start with LoginScreen
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
    ServicesPage(),
    DonationAdoptionPage(),
    CommunityPage(),
  ];

  void _onAvatarTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetailsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC9A0DC), // Wisteria at the top
        elevation: 0,
        leading: GestureDetector(
          onTap: _onAvatarTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=3',
              ),
              radius: 20,
            ),
          ),
        ),
        title: Text(
          'Hello, User',
          style: TextStyle(
            color: Colors.white, // contrast on Wisteria
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFC9A0DC), // Wisteria at the bottom too
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}

// ================= Pages =================

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Services Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class DonationAdoptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Donation & Adoption Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Community Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Color(0xFF9370DB), // medium purple
      ),
      body: Center(
        child: Text(
          'User Details Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
