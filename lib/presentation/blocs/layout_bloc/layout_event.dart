part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object> get props => [];
}

class ChangeLayout extends LayoutEvent {
  final bool isGridLayoutMode;

  const ChangeLayout(this.isGridLayoutMode);
}
