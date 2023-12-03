part of 'sample_bloc.dart';

@immutable
class SampleState {
  const SampleState({
    this.value = const Field.pure(),
  });

  final Field value;

  SampleState copyWith({
    Field? value,
  }) {
    return SampleState(
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SampleState &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
