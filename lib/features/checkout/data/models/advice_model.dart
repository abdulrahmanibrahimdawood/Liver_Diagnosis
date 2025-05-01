class AdviceModel {
  final String id;
  final String title;
  final String description;
  final String image;

  AdviceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory AdviceModel.fromJson(Map<String, dynamic> jsonData) {
    String baseUrl =
        "https://0c00-156-197-244-192.ngrok-free.app/projectq-main/project/advice/uploads/";
    String imagePath = jsonData['advice_image'] ?? "";

    if (imagePath.startsWith("uploads/")) {
      imagePath = imagePath.replaceFirst("uploads/", "");
    }

    return AdviceModel(
      id: jsonData['advice_id'].toString(),
      title: jsonData['title'] ?? "No title",
      description: jsonData['description'] ?? "No description",
      image: "$baseUrl$imagePath",
    );
  }
}
