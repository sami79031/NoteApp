
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_taking_app/domain/core/value.objects.dart';
part 'user.freezed.dart';

@freezed
abstract class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    @required UniqueID id,
}) = _CurrentUser;
}