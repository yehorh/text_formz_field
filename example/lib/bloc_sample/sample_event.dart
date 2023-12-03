part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {
  const SampleEvent();
}

class SampleEventValueUpdated extends SampleEvent {
  const SampleEventValueUpdated(this.value);

  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SampleEventValueUpdated &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
