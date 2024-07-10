part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}
final class LoadingDataState extends HomePageState {}
final class GetDataSucState extends HomePageState {}
