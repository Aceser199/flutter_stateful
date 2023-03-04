import 'package:flutter/material.dart';
import 'package:flutter_temp/utils/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              const SizedBox(height: 20),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
        icon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null) {
          return 'please enter an email address';
        }
        if (value.isEmpty) {
          return 'Please enter an email address';
        }

        if (!value.isValidEmail()) {
          return "Invalid email address";
        }

        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value == null) {
          return 'please enter a password';
        }
        if (value.isEmpty) {
          return 'Please enter a password';
        }
        int minLength = 3;

        if (value.length < minLength) {
          return 'Password needs to be at least $minLength characters long';
        }

        return null;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton.icon(
      onPressed: validateCred,
      icon: const Icon(Icons.login),
      label: const Text('SIGN IN'),
    );
  }

  void validateCred() {
    final isValid = formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    formKey.currentState?.save();

    formKey.currentState?.reset();
  }
}
