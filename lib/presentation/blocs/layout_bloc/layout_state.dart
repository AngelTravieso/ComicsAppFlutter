part of 'layout_bloc.dart';

class LayoutState extends Equatable {
  final bool isGridLayoutMode;

  const LayoutState({
    this.isGridLayoutMode = true,
  });

  LayoutState copyWith({
    bool? isGridLayoutMode,
  }) =>
      LayoutState(
        isGridLayoutMode: isGridLayoutMode ?? this.isGridLayoutMode,
      );

  @override
  List<Object> get props => [isGridLayoutMode];
}
