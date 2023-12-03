
import 'package:bloc/bloc.dart';
import 'package:example/shared/field.dart';
import 'package:meta/meta.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(const SampleState()) {
    on<SampleEventValueUpdated>((event, emit) {
      emit(state.copyWith(value: Field.pure(event.value)));
    });
  }
}
