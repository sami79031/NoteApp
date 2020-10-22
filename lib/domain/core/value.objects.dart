import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), (r) => r);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{value: $value}';
  }
}

class UniqueID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueID() {
    return UniqueID._(
        right(Uuid().v1())
    );
  }

  factory UniqueID.fromUniqueString(String uniqueID) {
    assert(uniqueID != null);

    return UniqueID._(
        right(uniqueID)
    );
  }

  const UniqueID._(this.value);
}