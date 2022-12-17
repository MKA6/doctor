class UserDoctorCategory {
  String? id;
  String? imageUrl;
  String? name;
  String? specialization;
  String? location;
  String? email;
  String? phone;
  String? workDays;
  String? workTime;
  String? bookDoctor;

  String? Rating = '';

  UserDoctorCategory({
    this.id,
    this.imageUrl,
    this.name,
    this.specialization,
    this.location,
    this.email,
    this.phone,
    this.workDays,
    this.workTime,
    this.bookDoctor,

    this.Rating= '',
  });

  toMap() {
    return {
      "imageUrl": imageUrl,
      "name": name,
      "specialization": specialization,
      'location': location,
      'email': email,
      'phone': phone,
      'workDays': workDays,
      'workTime': workTime,
      'bookDoctor': bookDoctor,

      'Rating': Rating= '',
    };
  }

  UserDoctorCategory.fromMap(Map<String, dynamic> map) {
    imageUrl = map["imageUrl"];
    name = map["name"];
    specialization = map["specialization"];
    location = map['location'];
    email = map['email'];
    phone = map['phone'];
    workDays = map['workDays'];
    workTime = map['workTime'];
    bookDoctor = map['bookDoctor'];
    Rating = map['Rating']= '';
  }
}
