import 'package:flutter/material.dart';
import 'service_provider_login.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Color(0xFFC9A0DC),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.settings),
            onSelected: (value) {
              if (value == 'login') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceProviderLoginPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'login',
                  child: Row(
                    children: [
                      Icon(Icons.login, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Service Provider Login'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Services Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
