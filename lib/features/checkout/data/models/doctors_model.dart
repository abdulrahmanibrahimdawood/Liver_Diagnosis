class DoctorsModel {
  final String id;
  final String image;
  final String name;
  final String location;
  final String governorate;
  final double longitude;
  final double latitude;
  final int age;

  DoctorsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.governorate,
    required this.longitude,
    required this.latitude,
    required this.age,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> jsonData) {
    String baseUrl =
        "https://8ac7-197-53-6-118.ngrok-free.app/project/doc/uploads/";
    String imagePath = jsonData['doc_image'] ?? "";

    if (imagePath.startsWith("uploads/")) {
      imagePath = imagePath.replaceFirst("uploads/", "");
    }

    return DoctorsModel(
      id: jsonData['doc_id'].toString(),
      image: "$baseUrl$imagePath",
      name: jsonData['doc_name'] ?? "No name",
      location: jsonData['doc_location'] ?? "No location",
      governorate: jsonData['doc_governorate'] ?? "No governorate",
      longitude: double.tryParse(jsonData['longitude'].toString()) ?? 0.0,
      latitude: double.tryParse(jsonData['latitude'].toString()) ?? 0.0,
      age: int.tryParse(jsonData['doc_age'].toString()) ?? 0,
    );
  }
}
