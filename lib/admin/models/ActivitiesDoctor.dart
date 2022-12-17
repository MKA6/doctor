import 'dart:convert';

class ActivitiesDoctor{
  String? id;
  String? catId;
  String? imageUrl;
  String? description;

  ActivitiesDoctor({
    this.id,
    this.catId,
    this.imageUrl,
    this.description,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catId': catId,
      'imageUrl' : imageUrl,
      'description' :description,
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
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    return result;
  }

  factory ActivitiesDoctor.fromMap(Map<String, dynamic> map) {
    return ActivitiesDoctor(
      id: map['id'] != null ? map['id'] as String : null,
      catId: map['catId'] != null ? map['catId'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      description:
      map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivitiesDoctor.fromJson(String source) =>
      ActivitiesDoctor.fromMap(json.decode(source));

}