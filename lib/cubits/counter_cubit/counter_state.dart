// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counterValue;
  final bool? wasIncremented;

  const CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}
