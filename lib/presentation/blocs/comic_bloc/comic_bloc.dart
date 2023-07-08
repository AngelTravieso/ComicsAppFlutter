import 'package:comics_app/domain/model/models.dart';
import 'package:comics_app/domain/repositories/comic_respository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'comic_event.dart';
part 'comic_state.dart';

/// Class [ComicBloc]
class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final comicRepository = ComicRepository();
  ComicBloc() : super(const ComicState()) {
    on<GetComicData>(_onGetComicData);
    on<GetComicDetail>(_onGetComicDetail);
  }

  /// Make a request to get the comics data and update the status accordingly.
  ///
  /// [event]: The `GetComicData` event that triggered this function.
  /// [emit]: The emitter that is used to emit a new state.
  void _onGetComicData(GetComicData event, Emitter<ComicState> emit) async {
    try {
      final comics = await comicRepository.getComics();

      emit(state.copyWith(
        loadingData: false,
        comicsData: comics,
      ));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }

      emit(state.copyWith(
        loadingData: false,
      ));
    }
  }

  /// Make a request to get the details of a specific comic and update the status accordingly.
  ///
  /// [event]: The `GetComicDetail` event that triggered this function.
  /// [emit]: The emitter used to emit a new state.
  void _onGetComicDetail(GetComicDetail event, Emitter<ComicState> emit) async {
    try {
      final comic = await comicRepository.getComicDetail(
        endpoint: event.comicUrl,
      );

      emit(state.copyWith(
        loadingData: false,
        comicDetail: comic,
      ));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }

      emit(state.copyWith(
        loadingData: false,
      ));
    }
  }

  /// Fire a `GetComicData` event to get the comic data.
  void getComicData() {
    add(GetComicData());
  }

  /// Fire a `GetComicDetail` event to get the details of a specific comic.
  ///
  /// [comicUrl]: The URL of the comic from which to get the details.
  void getComicDetail({required String comicUrl}) {
    add(GetComicDetail(comicUrl));
  }
}
