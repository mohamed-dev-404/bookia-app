part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoadedSuccessfully extends HomeState {
  //? if it exists it means that there is Partial success, and it will hold the error message of failed endpoint(s)
  //? if it's null, it means that both endpoints succeeded without any errors
  final String? warningMessage;

  HomeLoadedSuccessfully({this.warningMessage});
}

final class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}
