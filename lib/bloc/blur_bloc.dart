import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blur_event.dart';
part 'blur_state.dart';

class BlurBloc extends Bloc<BlurEvent, bool> {
  BlurBloc() : super(false);

  @override
  Stream<bool> mapEventToState(
    BlurEvent event,
  ) async* {
    switch (event) {
      case BlurEvent.update:
        yield !state;
        break;
    }
  }
}
