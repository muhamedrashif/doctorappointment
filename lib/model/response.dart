class ResponseModel {
  String message;
  String token;
  String name;
  String bookingid;
  ResponseModel(
      {required this.message,
      required this.token,
      required this.name,
      required this.bookingid});
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json["msg"].toString(),
        token: json["token"].toString(),
        name: json["name"] ?? "",
        bookingid: json["bookingid"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "msg": message.toString(),
        "token": token.toString(),
      };
}
