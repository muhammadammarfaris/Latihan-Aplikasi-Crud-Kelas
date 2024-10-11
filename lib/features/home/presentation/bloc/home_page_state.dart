part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageLoaded extends HomePageState {}

class TabState extends Equatable {
  final int selectedIndex;

  const TabState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
