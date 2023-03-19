import 'package:flutter/material.dart';

class SuggestImprovementPage extends StatefulWidget {
  @override
  _SuggestImprovementPageState createState() => _SuggestImprovementPageState();
}

class _SuggestImprovementPageState extends State<SuggestImprovementPage> {
  final _formKey = GlobalKey<FormState>();
  final _suggestionController = TextEditingController();
  bool _isLoading = false;

  void _submitSuggestion() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement submission of suggestion
      setState(() {
        _isLoading = true;
      });
      // Simulate network delay
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          // Clear text field
          _suggestionController.clear();
          // Show success snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Thank you for your suggestion!')),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Suggest an Improvement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What can we improve?',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _suggestionController,
                decoration: InputDecoration(
                  hintText: 'Enter your suggestion here',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a suggestion';
                  }
                  return null;
                },
                maxLines: null,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitSuggestion,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child:
                    _isLoading ? CircularProgressIndicator() : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
