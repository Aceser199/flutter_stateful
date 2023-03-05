import 'package:flutter/material.dart';
import 'package:flutter_temp/mixins/validation_mixin.dart';
import 'package:flutter_temp/utils/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: (String? newValue) {
        email = newValue.toString();
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
      validator: validatePassword,
      onSaved: (String? newValue) {
        password = newValue.toString();
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

    print('$email & $password');

    formKey.currentState?.reset();
  }
}
