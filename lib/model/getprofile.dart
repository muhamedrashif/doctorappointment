class Getprofile {
  String id;
  String name;
  String phone;
  String email;
  String address;
  String image;

  Getprofile({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  factory Getprofile.fromJson(Map<String, dynamic> json) => Getprofile(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"] ?? '',
        address: json["address"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "image": image,
      };
}
