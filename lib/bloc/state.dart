part of 'bloc.dart';

@immutable
abstract class DataState extends Equatable {
  const DataState();
  @override
  List<Object> get props => [];
}

class DataListState extends DataState {
  final List<FoodModel>? data;

  const DataListState({this.data});
}

class InitialData extends DataState {}

class FailureData extends DataState {}

class LoadingData extends DataState {}

class EmptyData extends DataState {}
