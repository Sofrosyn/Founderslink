import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:founderslink/core/error/faliure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> action(Params params);
}

abstract class AltUseCase<Params> {
  Future<void> action(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}