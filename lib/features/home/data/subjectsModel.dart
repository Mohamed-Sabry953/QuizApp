class SubjectsModel {
  String subjectName;
  String subjectImage;
  String id;
  int timer;

  SubjectsModel(
      {required this.subjectName,
      required this.subjectImage,
      required this.id,
      required this.timer,
      });

  SubjectsModel.fromjson(Map<String, dynamic> json)
      : this(
    subjectName: json["SubjectName"],
    subjectImage: json["image"],
    id: json["id"],
    timer: json["timer"],
  );

  Map<String, dynamic> Tojson() {
    return {
      "SubjectName": subjectName,
      "image": subjectImage,
      "id": id,
      "timer": timer,
    };
  }
}