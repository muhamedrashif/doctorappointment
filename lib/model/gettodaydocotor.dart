class Todaydoctor {
  String id;
  String time;
  String status;
  String doctorid;
  DateTime date;
  String name;
  String qualification;
  String fees;
  String experience;
  String description;
  String image;
  String specialisedid;
  String specialisedname;

  Todaydoctor({
    required this.id,
    required this.time,
    required this.status,
    required this.doctorid,
    required this.date,
    required this.name,
    required this.qualification,
    required this.fees,
    required this.experience,
    required this.description,
    required this.image,
    required this.specialisedid,
    required this.specialisedname,
  });

  factory Todaydoctor.fromJson(Map<String, dynamic> json) => Todaydoctor(
        id: json["id"],
        time: json["time"],
        status: json["status"],
        doctorid: json["doctorid"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        qualification: json["qualification"],
        fees: json["fees"],
        experience: json["experience"],
        description: json["description"],
        image: json["image"],
        specialisedid: json["specialisedid"],
        specialisedname: json["specialisedname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "status": status,
        "doctorid": doctorid,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
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
