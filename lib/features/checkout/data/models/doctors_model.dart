class DoctorsModel {
  final String id;
  final String image;
  final String name;
  final String location;
  final String governorate;
  final double longitude;
  final double latitude;
  final int age;
  final String phone;

  DoctorsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.governorate,
    required this.longitude,
    required this.latitude,
    required this.age,
    required this.phone,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> jsonData) {
    const baseUrl =
        "http://26c6-156-197-156-110.ngrok-free.app/projectq-main/project/doc/uploads/";
    var imagePath = jsonData['image'] ?? "";
    if (imagePath.startsWith("uploads/")) {
      imagePath = imagePath.replaceFirst("uploads/", "");
    }
    return DoctorsModel(
      id: jsonData['id'].toString(),
      image: "$baseUrl$imagePath",
      name: jsonData['doc_name']?.toString().trim() ?? "No name",
      location: jsonData['doc_location']?.toString().trim() ?? "No location",
      governorate:
          jsonData['doc_governorate']?.toString().trim() ?? "No governorate",
      longitude: double.tryParse(jsonData['longitude'].toString()) ?? 0.0,
      latitude: double.tryParse(jsonData['latitude'].toString()) ?? 0.0,
      age: int.tryParse(jsonData['doc_age'].toString()) ?? 0,
      phone: jsonData['phone']?.toString().trim() ?? "1288170356",
    );
  }
}
