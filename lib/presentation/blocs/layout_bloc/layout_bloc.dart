import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(const LayoutState()) {
    on<ChangeLayout>(_onChangeLayoutMode);
  }

  void _onChangeLayoutMode(ChangeLayout event, Emitter<LayoutState> emit) {
    emit(state.copyWith(
      isGridLayoutMode: event.isGridLayoutMode,
    ));
  }
}
