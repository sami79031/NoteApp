import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_taking_app/domain/auth/user.dart';
import 'package:note_taking_app/domain/core/value.objects.dart';

extension FirebaseUserDomainX on User {
  CurrentUser toDomain() {
    return CurrentUser(id: UniqueID.fromUniqueString(uid));
  }
}