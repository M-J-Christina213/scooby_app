import 'package:flutter/material.dart';

class ServiceProviderLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Login'),
        backgroundColor: Color(0xFF9370DB),
      ),
      body: Center(
        child: Text(
          'Service Provider Login Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
