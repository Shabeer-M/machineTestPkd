part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class FetchCustomerData extends HomeEvent {}
