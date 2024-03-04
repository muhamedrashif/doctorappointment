class Imagescroll {
  String id;
  String image;

  Imagescroll({
    required this.id,
    required this.image,
  });

  factory Imagescroll.fromJson(Map<String, dynamic> json) => Imagescroll(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
