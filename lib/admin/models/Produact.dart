import 'dart:convert';

class Produact {
  String? id;
  String? catId;
  String? location;
  String? email;
  String? phone;
  String? workDays;
  String? workTime;
  String? bookDoctor;
  String? Rating = '';

  Produact({
    this.id,
    this.catId,
    this.location,
    this.email,
    this.phone,
    this.workDays,
    this.workTime,
    this.bookDoctor,
    this.Rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catId': catId,
      'location': location,
      'email': email,
      'phone': phone,
      'workDays': workDays,
      'workTime': workTime,
      'bookDoctor': bookDoctor,
      'Rating': Rating,
    };
  }

  Map<String, dynamic> toMap1() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (catId != null) {
      result.addAll({'catId': catId});
    }
    if (location != null) {
      result.addAll({'price': location});
    }
    if (email != null) {
      result.addAll({'price': email});
    }
    if (phone != null) {
      result.addAll({'price': phone});
    }
    if (workDays != null) {
      result.addAll({'price': workDays});
    }
    if (workTime != null) {
      result.addAll({'price': workTime});
    }
    if (bookDoctor != null) {
      result.addAll({'price': bookDoctor});
    }
    if (Rating != null) {
      result.addAll({'price': Rating});
    }
    return result;
  }

  factory Produact.fromMap(Map<String, dynamic> map) {
    return Produact(
      id: map['id'] != null ? map['id'] as String : null,
      catId: map['catId'] != null ? map['catId'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      workDays: map['workDays'] != null ? map['workDays'] as String : null,
      workTime: map['workTime'] != null ? map['workTime'] as String : null,
      bookDoctor:
          map['bookDoctor'] != null ? map['bookDoctor'] as String : null,
      Rating: map['Rating'] != null ? map['Rating'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produact.fromJson(String source) =>
      Produact.fromMap(json.decode(source));
}
