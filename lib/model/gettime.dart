class Time {
  String id;
  String time;
  String status;
  String doctorid;
  DateTime date;

  Time({
    required this.id,
    required this.time,
    required this.status,
    required this.doctorid,
    required this.date,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json["id"],
        time: json["time"],
        status: json["status"],
        doctorid: json["doctorid"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "status": status,
        "doctorid": doctorid,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
