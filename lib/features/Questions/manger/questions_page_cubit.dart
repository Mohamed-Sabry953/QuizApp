import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/cache/CacheData.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/Questions/data/questionModel.dart';
import 'package:quiz_app/features/answerAndDgree/pages/answerAndDgree.dart';
import 'package:quiz_app/features/home/data/questionToSubject.dart';
part 'questions_page_state.dart';

class QuestionsPageCubit extends Cubit<QuestionsPageState> {
  QuestionsPageCubit() : super(QuestionsPageInitial());

  static QuestionsPageCubit get(context) => BlocProvider.of(context);
  int questionNumber = 0;
  int answerNumber = -1;
  int timerNum = 0;
  List<QuestionModel>question=[];
  List<int>studentAnswerNumber=[];
  bool accCheck=false;

  initState(String name,String id,int timer,BuildContext context) {
    timerNum=timer;
    emit(StartDuration());
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerNum > 0) {
        emit(DurationLoading());
        timerNum -= 1;
      }
      else {
        timer.cancel();
        ConstantLists.questions=question;
        ConstantLists.answer=studentAnswerNumber;
        for(int i=0;i<ConstantLists.questions.length;i++){
          if(ConstantLists.answer[i].toString()==ConstantLists.questions[i].trueAnswer.toString()){
            ConstantLists.degree++;
          }
        }
        Navigator.pushNamedAndRemoveUntil(context,
            AnswerAndDgreePage.routeName, (route) => false,
            arguments: QuestionToSubject(
                subjectName: name,
                id: id,
                timer: timerNum));
      }
    }
      ,);
    emit(DurationOut());
  }

  changeQuestionNumber(int index) {
    questionNumber = index;
    emit(ChangeQuestionsNumSucState());
  }

  changeAnswerNumber(int index) {
    answerNumber = index;
    emit(ChangeAnswerNumSucState());
  }

  String formatDuration(Duration d) {
    final hours = d.inHours.remainder(24);
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    emit(HandleDurationFormat());
    return "${hours.toString().padLeft(1, "0")}.${minutes.toString().padLeft(
        2, "0")}.${seconds.toString().padLeft(2, "0")}";
  }

  getQuestionFromFirebase(String id) {
    if(CacheData.getUpgradeAccData(key: "Upgrade")==true){
      accCheck=true;
      emit(ChangeAccCheckState());
    }
    emit(LoadingDataState());
    FirebaseFirestore.instance
        .collection('arbic')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        QuestionModel questionModel = QuestionModel(
          subjectId: doc["SubjectId"],
            question: doc["question"],
            firstAnswer: doc["firstAnswer"],
            secondAnswer: doc["secondAnswer"],
            thirdAnswer: doc["thirdAnswer"],
            fourAnswer: doc["fourAnswer"],
            trueAnswer: doc["trueAnswer"],
            id: doc["id"]);
        if(questionModel.subjectId==id){
          studentAnswerNumber.add(-1);
          question.add(questionModel);
        }
      emit(GetDataSucState());
      }
    });
  }
  saveStudentAnswer(){
    if(studentAnswerNumber[questionNumber]== -1){
      studentAnswerNumber.removeAt(questionNumber);
      studentAnswerNumber.insert(questionNumber,answerNumber);
    }
    else{
      studentAnswerNumber.removeAt(questionNumber);
      studentAnswerNumber.insert(questionNumber,answerNumber);
    }
    emit(SaveStudentAnswerSucState());
  }
}
