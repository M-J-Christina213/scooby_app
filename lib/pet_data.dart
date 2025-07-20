// pet_data.dart
class Pet {
  final String name;
  final String age;
  final String medicalHistory;
  final String height;
  final String weight;
  final String moreInfo;

  Pet({
    required this.name,
    required this.age,
    required this.medicalHistory,
    required this.height,
    required this.weight,
    required this.moreInfo,
  });
}

class PetData {
  static List<Pet> pets = [];
}
