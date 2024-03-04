class Latestprescription {
  String doctorname;
  DateTime precriptiondate;
  String prescriptionimage;
  String prescription;

  Latestprescription({
    required this.doctorname,
    required this.precriptiondate,
    required this.prescriptionimage,
    required this.prescription,
  });

  factory Latestprescription.fromJson(Map<String, dynamic> json) {
    // log("inside model 1=="+json["doctorname"]);

    return Latestprescription(
      doctorname: json["doctorname"],
      precriptiondate: DateTime.parse(json["precriptiondate"]),
      prescriptionimage: json["prescriptionimage"],
      prescription: json["prescription"],
    );
  }

  Map<String, dynamic> toJson() => {
        "doctorname": doctorname,
        "precriptiondate":
            "${precriptiondate.year.toString().padLeft(4, '0')}-${precriptiondate.month.toString().padLeft(2, '0')}-${precriptiondate.day.toString().padLeft(2, '0')}",
        "prescriptionimage": prescriptionimage,
        "prescription": prescription,
      };
}
