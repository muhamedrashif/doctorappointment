// class Getspecialised {
//   List<Specialised> specialised;

//   Getspecialised({
//     required this.specialised,
//   });

//   factory Getspecialised.fromJson(Map<String, dynamic> json) {
//     return Getspecialised(
//       specialised: List<Specialised>.from(
//           json["specialised"].map((x) => Specialised.fromJson(x))),
//     );
//   }
// }

class Specialised {
  String id;
  String specialisedname;
  String image;

  Specialised({
    required this.id,
    required this.specialisedname,
    required this.image,
  });

  factory Specialised.fromJson(Map<String, dynamic> json) {
    print("id==" + json["id"].toString());
    print("specialisedname==" + json["specialisedname"].toString());
    print("image==" + json["image"].toString());
    return Specialised(
      id: json["id"].toString(),
      specialisedname: json["specialisedname"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialisedname": specialisedname,
        "image": image,
      };
}
