part of 'comic_bloc.dart';

class ComicState extends Equatable {
  final bool loadingData;
  final ComicModel? comicsData;
  final ComicDetail? comicDetail;

  const ComicState({
    this.loadingData = true,
    this.comicsData,
    this.comicDetail,
  });

  ComicState copyWith({
    bool? loadingData,
    ComicModel? comicsData,
    ComicDetail? comicDetail,
  }) =>
      ComicState(
        loadingData: loadingData ?? this.loadingData,
        comicsData: comicsData ?? this.comicsData,
        comicDetail: comicDetail ?? this.comicDetail,
      );

  @override
  List<Object?> get props => [
        loadingData,
        comicsData,
        comicDetail,
      ];
}
