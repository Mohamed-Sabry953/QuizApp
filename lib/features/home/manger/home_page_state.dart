part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}
final class LoadingHomeDataState extends HomePageState {}
final class LoadingDataRefreshState extends HomePageState {}
final class GetDataSucState extends HomePageState {}
final class GetDataSucRefreshState extends HomePageState {}
final class SetPictureSucUploadState extends HomePageState {}
final class SetPictureErrorUploadState extends HomePageState {}
final class SetPictureSucUploadToFirebaseState extends HomePageState {}
final class SubjectLoadingState extends HomePageState {}
final class UpdateSubjectSucState extends HomePageState {}
final class AddQuestionSuccsesState extends HomePageState {}
final class AddQuestionLoadingState extends HomePageState {}
final class ChangeAccCheckState extends HomePageState {}
