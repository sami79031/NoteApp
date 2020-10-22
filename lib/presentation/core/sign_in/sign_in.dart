import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/application/auth/sign_in_form/sign_in_bloc.dart';
import 'package:note_taking_app/injection.dart';
import 'package:note_taking_app/presentation/core/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
