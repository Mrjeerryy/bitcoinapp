import 'package:bitcoinapp/price_screen.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _feedback = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data and send the feedback
      print('Name: $_name');
      print('Email: $_email');
      print('Feedback: $_feedback');
      // Here you can add your logic to send the feedback to a server or email
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@gmail.com')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Feedback',
                    labelStyle: TextStyle(color: Colors.black)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
                onSaved: (value) => _feedback = value!,
              ),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PriceScreen()),
                  );
                },
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
