class Latestdocotorvisited {
  String image;
  String doctorname;
  String qualification;
  String experience;
  String categoryname;

  Latestdocotorvisited({
    required this.image,
    required this.doctorname,
    required this.qualification,
    required this.experience,
    required this.categoryname,
  });

  factory Latestdocotorvisited.fromJson(Map<String, dynamic> json) =>
      Latestdocotorvisited(
        image: json["image"],
        doctorname: json["doctorname"],
        qualification: json["qualification"],
        experience: json["experience"],
        categoryname: json["categoryname"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "doctorname": doctorname,
        "qualification": qualification,
        "experience": experience,
        "categoryname": categoryname,
      };
}
