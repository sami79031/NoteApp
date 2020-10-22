import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  @override
  AuthBloc(this._authFacade) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
        authCheckRequested: (e) async* {
          final userOption = await _authFacade.getSignedUser();
          yield userOption.fold(
                  () => const AuthState.unAuthenticated(),
                  (_) => const AuthState.authenticated());
        },
        signOut: (e) async* {
          await _authFacade.signOut();
          yield const AuthState.unAuthenticated();
        });
  }
}