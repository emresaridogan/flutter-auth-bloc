import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';
import '../bloc/authentication_state.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const CircularProgressIndicator();
        } else if (state is AuthenticationSuccess) {
          return const Center(child: Text("Login Successful"));
        } else if (state is AuthFailure) {
          return Center(child: Text(state.error));
        }

        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: email,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) => email.text = value!,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => password.text = value!,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                    SignUpButtonPressed(
                        email: email.text, password: password.text));
              },
              child: const Text('Sign Up'),
            )
          ],
        ));
      },
    );
  }
}
