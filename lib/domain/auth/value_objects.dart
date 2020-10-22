
import 'package:dartz/dartz.dart';
import 'package:note_taking_app/domain/core/failures.dart';
import 'package:note_taking_app/domain/core/value.objects.dart';
import 'package:note_taking_app/domain/core/value_validators.dart';



class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const EmailAddress._(this.value);

  factory EmailAddress(String input) {
    assert(input != null);

    return EmailAddress._(
      validateEmailAddress(input.trim())
    );
  }
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String input) {
    assert(input != null);

    return Password._(
        validatePassword(input)
    );
  }
}



