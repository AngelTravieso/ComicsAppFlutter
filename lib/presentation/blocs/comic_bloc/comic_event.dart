part of 'comic_bloc.dart';

abstract class ComicEvent extends Equatable {
  const ComicEvent();

  @override
  List<Object> get props => [];
}

class GetComicData extends ComicEvent {}

class GetComicDetail extends ComicEvent {
  final String comicUrl;

  const GetComicDetail(this.comicUrl);
}
