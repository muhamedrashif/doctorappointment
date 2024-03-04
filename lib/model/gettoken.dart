import 'dart:developer';

class Token {
  String id;
  String doctorid;
  String doctorname;
  String status;
  String appointmentdate;
  String appointmenttime;
  String specialisedname;
  String bookingid;

  Token(
      {required this.id,
      required this.doctorid,
      required this.doctorname,
      required this.status,
      required this.appointmentdate,
      required this.appointmenttime,
      required this.specialisedname,
      required this.bookingid});

  factory Token.fromJson(Map<String, dynamic> json) {
    log("id========" + json["id"]);
    log("doctorid========" + json["doctorid"]);
    log("doctorname========" + json["doctorname"]);
    log("status========" + json["status"]);
    log("appointmentdate========" + json["appointmentdate"]);
    log("appointmenttime========" + json["appointmenttime"]);
    log("specialisedname========" + json["specialisedname"]);
    log("bookingid========" + json["bookingid"]);

    return Token(
      id: json["id"] ?? '',
      doctorid: json["doctorid"] ?? '',
      doctorname: json["doctorname"] ?? '',
      status: json["status"] ?? '',
      appointmentdate: json["appointmentdate"] ?? '',
      appointmenttime: json["appointmenttime"] ?? '',
      specialisedname: json["specialisedname"] ?? '',
      bookingid: json["bookingid"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorid": doctorid,
        "doctorname": doctorname,
        "status": status,
        "appointmentdate": appointmentdate,
        "appointmenttime": appointmenttime,
        "specialisedname": specialisedname,
        "bookingid": bookingid
      };
}
