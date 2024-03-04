// class Getdoctor {
//   List<Datum> data;

//   Getdoctor({
//     required this.data,
//   });

//   // factory Getdoctor.fromJson(Map<String, dynamic> json) => Getdoctor(
//   //     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   // );

//   // Map<String, dynamic> toJson() => {
//   //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   // };
//   factory Getdoctor.fromJson(Map<String, dynamic> json) {
//     return Getdoctor(
//       data: List<Datum>.from(json["doctor"].map((x) => Datum.fromJson(x))),
//     );
//   }
// }

class Datum {
  String id;
  String name;
  String qualification;
  String fees;
  String experience;
  String description;
  String image;
  String specialisedid;
  String specialisedname;

  Datum(
      {required this.id,
      required this.name,
      required this.qualification,
      required this.fees,
      required this.experience,
      required this.description,
      required this.image,
      required this.specialisedid,
      required this.specialisedname});

  factory Datum.fromJson(Map<String, dynamic> json) {
    // print("id==" + json["id"].toString());
    // print("name==" + json["name"].toString());
    // print("qualification==" + json["qualification"].toString());
    // print("fees==" + json["fees"].toString());
    // print("experience==" + json["experience"].toString());
    // print("description==" + json["description"].toString());
    // print("image==" + json["image"].toString());
    // print("categoryid==" + json["categoryid"].toString());
    return Datum(
      id: json["id"],
      name: json["name"],
      qualification: json["qualification"],
      fees: json["fees"],
      experience: json["experience"],
      description: json["description"],
      image: json["image"],
      specialisedid: json["specialisedid"],
      specialisedname: json["specialisedname"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qualification": qualification,
        "fees": fees,
        "experience": experience,
        "description": description,
        "image": image,
        "specialisedid": specialisedid,
        "specialisedname": specialisedname,
      };
}
