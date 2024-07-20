class QuestionModel {
  String firstAnswer;
  String question;
  String secondAnswer;
  String thirdAnswer;
  String fourAnswer;
  String subjectId;
  String id;
  int trueAnswer;

  QuestionModel(
      {required this.question,
      required this.firstAnswer,
      required this.secondAnswer,
      required this.thirdAnswer,
      required this.fourAnswer,
        required this.id,
      required this.subjectId,
      required this.trueAnswer});

  QuestionModel.fromjson(Map<String, dynamic> json)
      : this(
          question: json["question"],
          firstAnswer: json["firstAnswer"],
          secondAnswer: json["secondAnswer"],
          thirdAnswer: json["thirdAnswer"],
          fourAnswer: json["fourAnswer"],
          trueAnswer: json["trueAnswer"],
          subjectId: json["SubjectId"],
          id: json["id"],
        );

  Map<String, dynamic> Tojson() {
    return {
      "question": question,
      "firstAnswer": firstAnswer,
      "secondAnswer": secondAnswer,
      "thirdAnswer": thirdAnswer,
      "fourAnswer": fourAnswer,
      "trueAnswer": trueAnswer,
      "SubjectId": subjectId,
      "id":id
    };
  }
}
