class Prescription {
  String id;
  String doctorname;
  DateTime precriptiondate;
  String prescriptionimage;
  String prescription;

  Prescription({
    required this.id,
    required this.doctorname,
    required this.precriptiondate,
    required this.prescriptionimage,
    required this.prescription,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
       print("id==" + json["id"].toString());
    print("doctorname==" + json["doctorname"].toString());
    print("precriptiondate==" + json["precriptiondate"].toString());
    print("prescriptionimage==" + json["prescriptionimage"].toString());
    print("prescription==" + json["prescription"].toString());
    return Prescription(
        id: json["id"] ?? '',
        doctorname: json["doctorname"] ?? '',
        precriptiondate: DateTime.parse(json["precriptiondate"]) ,
        prescriptionimage: json["prescriptionimage"] ?? '',
        prescription: json["prescription"] ?? '',
      );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorname": doctorname,
        "precriptiondate":
            "${precriptiondate.year.toString().padLeft(4, '0')}-${precriptiondate.month.toString().padLeft(2, '0')}-${precriptiondate.day.toString().padLeft(2, '0')}",
        "prescriptionimage": prescriptionimage,
        "prescription": prescription,
      };
}
