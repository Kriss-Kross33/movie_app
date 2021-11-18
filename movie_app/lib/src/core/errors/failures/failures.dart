import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final FailureType failureType;

  const Failure({required this.failureType});
  @override
  List<Object> get props => [failureType];
}

enum FailureType {
  api,
  network,
}
