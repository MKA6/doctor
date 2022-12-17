class CategoryDoctor {
  String? id;
  String? imageUrl;
  String? name;
  String? specialization;
  String? workDays;
  String? workTime;
  String? Rating;

  CategoryDoctor({
    this.imageUrl,
    this.name,
    this.specialization,
    this.workDays,
    this.workTime,
    this.Rating,
  });

  toMap() {
    return {
      "imageUrl": imageUrl,
      "name": name,
      "specialization": specialization,
      "workDays": workDays,
      "workTime": workTime,
      "Rating": Rating
    };
  }

  CategoryDoctor.fromMap(Map<String, dynamic> map) {
    imageUrl = map["imageUrl"];
    name = map["name"];
    specialization = map["specialization"];
    workDays = map["workDays"];
    workTime = map["workTime"];
    Rating = map["Rating"];
  }
}
