import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabState(selectedIndex: 0)) {
    on<TabChanged>((event, emit) {
      emit(TabState(selectedIndex: event.index));
    });
  }
}
