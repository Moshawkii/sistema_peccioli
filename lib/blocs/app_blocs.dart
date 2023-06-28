import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_peccioli_2/blocs/app_events.dart';
import 'package:sistema_peccioli_2/blocs/app_state.dart';
import 'package:sistema_peccioli_2/repository/repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _repository;

  HomeBloc(this._repository) : super(HomeLoadingState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final response = await _repository.getHome();
        emit(HomeLoadedState(response));
      } catch (error) {
        print('ERRORE: $error');
        emit(HomeErrorState(error.toString()));
      }
    });
  }
}
