class BlogsModel {
  late String id;
  late String title;
  late String description;
  late String image;

  BlogsModel({
    required this.title,
    required this.description,
    required this.image,
    required this.id,
  });

  BlogsModel.fromJson(Map<String, dynamic> blogs) {
    description = blogs["desctiption"];
    id = blogs["id"];
    image = blogs["img"];
    title = blogs["title"];
  }
}
