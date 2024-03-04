

class Clinic {
  String phone;
  String clinicid;
  String name;
  String number;

  Clinic({
    required this.phone,
    required this.clinicid,
    required this.name,
    required this.number,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        phone: json["phone"],
        clinicid: json["clinicid"],
        name: json["name"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "clinicid": clinicid,
        "name": name,
        "number": number,
      };
}
