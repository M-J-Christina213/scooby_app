import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceData {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  ServiceData({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'imagePath': imagePath,
      };

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imagePath'],
    );
  }
}

class ServiceManager {
  static final ServiceManager _instance = ServiceManager._internal();

  factory ServiceManager() => _instance;
  ServiceManager._internal();

  Map<String, ServiceData?> services = {
    'veterinarian': null,
    'groomer': null,
    'petsitter': null,
  };

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    for (var key in services.keys) {
      final jsonString = prefs.getString(key);
      if (jsonString != null) {
        services[key] = ServiceData.fromJson(json.decode(jsonString));
      }
    }
  }

  Future<void> saveService(String key, ServiceData data) async {
    services[key] = data;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(data.toJson()));
  }

  Future<void> deleteService(String key) async {
    services[key] = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
