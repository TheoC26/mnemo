class DementiaUserModel {
  DementiaUserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.caregiverUsers
  });

  String id;
  String name;
  int age;
  List<String> caregiverUsers;
}