import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/subjectsModel.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  List<SubjectsModel> subjectsObject = [];

  getSubjectFromFirebase() {
    emit(LoadingDataState());
    FirebaseFirestore.instance
        .collection('Subjects')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        SubjectsModel subjects = SubjectsModel(
            subjectName: doc["SubjectName"],
          subjectImage: doc["image"]
        );
        subjectsObject.add(subjects);
      }
      emit(GetDataSucState());
    });
  }
}
