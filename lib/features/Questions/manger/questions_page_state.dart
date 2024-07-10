part of 'questions_page_cubit.dart';

@immutable
sealed class QuestionsPageState {}

final class QuestionsPageInitial extends QuestionsPageState {}
final class ChangeQuestionsNumSucState extends QuestionsPageState {}
final class ChangeAnswerNumSucState extends QuestionsPageState {}
final class HandleDurationFormat extends QuestionsPageState {}
final class StartDuration extends QuestionsPageState {}
final class DurationLoading extends QuestionsPageState {}
final class DurationOut extends QuestionsPageState {}
final class LoadingDataState extends QuestionsPageState {}
final class GetDataSucState extends QuestionsPageState {}
final class SaveStudentAnswerSucState extends QuestionsPageState {}
