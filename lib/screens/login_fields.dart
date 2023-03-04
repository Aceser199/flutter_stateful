import 'package:flutter/material.dart';

Widget emailField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: 'Email Address',
      hintText: 'you@example.com',
      icon: Icon(Icons.email),
    ),
  );
}

Widget passwordField() {
  return TextFormField(
    // obscureText: true,
    decoration: const InputDecoration(
      labelText: 'Password',
      icon: Icon(Icons.lock),
    ),
    validator: (value) {},
  );
}

Widget submitButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.login),
    label: const Text('SIGN IN'),
  );
}
