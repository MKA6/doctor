class AppUser {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? imagUrl;

  AppUser(
    this.id,
    this.name,
    this.email, [
    this.imagUrl,
    this.phoneNumber,
  ]);

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "imagUrl": imagUrl,
      "phoneNumber": phoneNumber,
    };
  }

  AppUser.forMap(Map<String, dynamic> map) {
    email = map["email"];
    name = map["name"];
    imagUrl = map["imagUrl"];
    phoneNumber = map["phoneNumber"];
  }
}
