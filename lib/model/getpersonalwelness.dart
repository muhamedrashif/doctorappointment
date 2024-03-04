class PersonalWellness {
  String id;
  String personalWellnessName;
  String image;
  String doctorid;

  PersonalWellness({
    required this.id,
    required this.personalWellnessName,
    required this.image,
    required this.doctorid,
  });

  factory PersonalWellness.fromJson(Map<String, dynamic> json) =>
      PersonalWellness(
        id: json["id"],
        personalWellnessName: json["personal_wellness_name"],
        image: json["image"],
        doctorid: json["doctorid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "personal_wellness_name": personalWellnessName,
        "image": image,
        "doctorid": doctorid,
      };
}
