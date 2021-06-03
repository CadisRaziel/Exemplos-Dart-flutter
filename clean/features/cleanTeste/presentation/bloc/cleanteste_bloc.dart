import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'cleanteste_event.dart';
part 'cleanteste_state.dart';
class CleantesteBloc extends Bloc<CleantesteEvent, CleantesteState> {
  CleantesteBloc() : super(CleantesteInitial());
  @override
  Stream<CleantesteState> mapEventToState(
    CleantesteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
