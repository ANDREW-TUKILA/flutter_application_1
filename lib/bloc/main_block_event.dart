part of 'main_block_bloc.dart';

@immutable
abstract class MainBlockEvent {}

class AwaitForMove extends MainBlockEvent {}

class StopAwaitForMove extends MainBlockEvent {}
