class SubjectsModel {
  String subjectName;
  String subjectImage;

  SubjectsModel(
      {required this.subjectName,
      required this.subjectImage
      });

  SubjectsModel.fromjson(Map<String, dynamic> json)
      : this(
    subjectName: json["SubjectName"],
    subjectImage: json["image"],
  );

  Map<String, dynamic> Tojson() {
    return {
      "SubjectName": subjectName,
      "image": subjectImage,
    };
  }
}