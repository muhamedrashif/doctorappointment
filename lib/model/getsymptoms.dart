// class Getsymptoms {
//   List<Symptom> symptoms;

//   Getsymptoms({
//     required this.symptoms,
//   });

//   factory Getsymptoms.fromJson(Map<String, dynamic> json) {
//     return Getsymptoms(
//       symptoms:
//           List<Symptom>.from(json["symptoms"].map((x) => Symptom.fromJson(x))),
//     );
//   }
// }

class Symptom {
  String id;
  String symptomsname;
  String image;
  String doctorid;

  Symptom({
    required this.id,
    required this.symptomsname,
    required this.image,
    required this.doctorid,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
     print("id=="+json["id"].toString());
      print("symptomsname=="+json["symptomsname"].toString());
       print("image=="+json["image"].toString());
        print("doctorid=="+json["id"].toString());
    return Symptom(
        id: json["id"].toString(),
        symptomsname: json["symptomsname"],
        image: json["image"],
        doctorid: json["doctorid"].toString(),
      );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "symptomsname": symptomsname,
        "image": image,
        "doctorid": doctorid,
      };
}
