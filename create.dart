import 'package:flutter/material.dart';

class create extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<create> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _confirmPassword;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save form data and create account
      // Code to create account goes here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  validator: (value) {
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _confirmPassword = value;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Create Account'),
                ),
              ],
            ),
          )),
    );
  }
}
