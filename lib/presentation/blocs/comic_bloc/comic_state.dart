part of 'comic_bloc.dart';

class ComicState extends Equatable {
  final bool loadingData;
  final ComicModel? comicsData;

  const ComicState({
    this.loadingData = true,
    this.comicsData,
  });

  ComicState copyWith({
    bool? loadingData,
    ComicModel? comicsData,
  }) =>
      ComicState(
        loadingData: loadingData ?? this.loadingData,
        comicsData: comicsData ?? this.comicsData,
      );

  @override
  List<Object?> get props => [loadingData, comicsData];
}
