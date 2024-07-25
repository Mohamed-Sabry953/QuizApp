import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiz_app/core/cache/CacheData.dart';
import 'package:quiz_app/features/Questions/data/questionModel.dart';

import '../data/subjectsModel.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  List<SubjectsModel> subjectsObject = [];
  File? userImgFile;
  String? userImgFileUrl;
  CollectionReference subject = FirebaseFirestore.instance.collection('Subjects');
  bool accCheck=false;
  bool accDeas=false;

  getSubjectFromFirebase() {
    if(CacheData.getUpgradeAccData(key: "Upgrade")==true){
      accCheck=true;
      emit(ChangeAccCheckState());
    }
    emit(LoadingHomeDataState());
    FirebaseFirestore.instance
        .collection('Subjects')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        SubjectsModel subjects = SubjectsModel(
            subjectName: doc["SubjectName"],
          subjectImage: doc["image"],
          id: doc["id"],
          timer: doc["timer"],
        );
        subjectsObject.add(subjects);
      }
      emit(GetDataSucState());
    });
  }
  getSubjectFromFirebaseRefresh() {
    emit(LoadingDataRefreshState());
    FirebaseFirestore.instance
        .collection('Subjects')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        SubjectsModel subjects = SubjectsModel(
            subjectName: doc["SubjectName"],
          subjectImage: doc["image"],
          id: doc["id"],
          timer: doc["timer"],
        );
        subjectsObject.add(subjects);
      }
      emit(GetDataSucRefreshState());
    });
  }
  void pickImage() async {
    var status = await Permission.storage.request();
    if(status.isGranted){
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        userImgFile = File(image.path);
        emit(SetPictureSucUploadState());
      }
      emit(SetPictureErrorUploadState());
    }
  }
  Future<String> imageToFirebaseStorage() async {
    Reference imageRef =
    FirebaseStorage.instance.ref(basename(userImgFile!.path));
    await imageRef.putFile(userImgFile!);
    emit(SetPictureSucUploadToFirebaseState());
    return await imageRef.getDownloadURL();
  }
  updateUserFirebaseData(String subjectName,String id,int timer,BuildContext context) async {
    emit(SubjectLoadingState());
    return subject.doc(id).update(
        {"SubjectName": subjectName,
          "timer": timer,
        }).then((value) {
          Navigator.pop(context);
      emit(UpdateSubjectSucState());
    },).catchError((e){
      print(e.toString());
    });
  }
  CollectionReference<QuestionModel> getQuestionCollection() {
    return FirebaseFirestore.instance.collection("arbic").withConverter(
      fromFirestore: (snapshot, options) {
        return QuestionModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },
    );
  }
  CollectionReference<SubjectsModel> getSubjectsCollection() {
    return FirebaseFirestore.instance.collection("Subjects").withConverter(
      fromFirestore: (snapshot, options) {
        return SubjectsModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },
    );
  }

  addQuestionToFirebase(
      String question,
      String subjectId,
      String firstAnswer,
      String secondAnswer,
      String thirdAnswer,
      String fourAnswer,
      int trueAnswer,
      BuildContext context) async {
    emit(AddQuestionLoadingState());
    String docId = Random().nextInt(400000000).toString();
    QuestionModel user = QuestionModel(
        subjectId: subjectId,
        question: question,
        firstAnswer: firstAnswer,
        secondAnswer: secondAnswer,
        thirdAnswer: thirdAnswer,
        fourAnswer: fourAnswer,
        trueAnswer: trueAnswer,
        id: docId);
    var Collection = getQuestionCollection();
    var docRef = Collection.doc(docId);
    docRef.set(user);
    Navigator.pop(context);
    emit(AddQuestionSuccsesState());
  }
  addSubjectToFirebase(
      BuildContext context,String name ,int timer) async {
    userImgFileUrl= await imageToFirebaseStorage();
    emit(AddQuestionLoadingState());
    String docId = Random().nextInt(400000000).toString();
    SubjectsModel subjectsModel = SubjectsModel(
      id: docId,
      subjectImage: userImgFileUrl??"",
      subjectName: name,
      timer: timer,

    );
    var Collection = getSubjectsCollection();
    var docRef = Collection.doc(docId);
    docRef.set(subjectsModel);
    Navigator.pop(context);
    emit(AddQuestionSuccsesState());
  }

}
