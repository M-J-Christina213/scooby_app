class Pet {
  final String name;
  final int age;
  final String medicalHistory;
  final double height;
  final double weight;
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
