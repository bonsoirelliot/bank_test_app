import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, int> {
  BankBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    BankEvent event,
  ) async* {
    switch (event) {
      case BankEvent.increment:
        yield state + 1;
        break;
      case BankEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
