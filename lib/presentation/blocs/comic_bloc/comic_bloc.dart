import 'package:comics_app/domain/model/comic_model.dart';
import 'package:comics_app/domain/repositories/comic_respository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final comicRepository = ComicRepository();
  ComicBloc() : super(const ComicState()) {
    on<GetComicData>(_onGetComicData);
  }

  void _onGetComicData(GetComicData event, Emitter<ComicState> emit) async {
    // emit(state.copyWith(
    //   loadingData: true,
    // ));

    try {
      final comics = await comicRepository.getComics();

      if (kDebugMode) {
        print('data loaded');
        print(comics?.statusCode);
      }

      emit(state.copyWith(
        loadingData: false,
        comicsData: comics,
      ));
    } catch (error) {
      if (kDebugMode) {
        print('Error getting comics: $error');
      }

      emit(state.copyWith(
        loadingData: false,
      ));
    }
  }

  void getComicData() {
    add(GetComicData());
  }
}
