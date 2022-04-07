import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:meta/meta.dart';

part 'main_block_event.dart';
part 'main_block_state.dart';
// import 'package:flutter_application_1/main.dart';

class MainBlockBloc extends Bloc<MainBlockEvent, MainBlockState> {
  CardsPlaing cardsPlaing;
  MainBlockBloc({this.cardsPlaing}) : super(MainBlockInitial());

  @override
  Stream<MainBlockState> mapEventToState(
    MainBlockEvent event,
  ) async* {
    if (event is AwaitForMove) {
      await Future.delayed(Duration(seconds: 3));
      yield FirstPlayerMoveFirstState();
    } else if (event is StopAwaitForMove) {
      await Future.delayed(Duration(seconds: 1));
      yield MainBlockInitial();
    }
    // TODO: implement mapEventToState
  }
}
