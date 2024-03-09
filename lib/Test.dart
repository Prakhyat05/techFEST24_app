import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? _selectedDesignation;

  List<String> _designations = [
    'Core Coordinator',
    'Domain Coordinator',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Designation',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: _selectedDesignation,
              onChanged: (newValue) {
                setState(() {
                  _selectedDesignation = newValue!;
                });
              },
              items: _designations.map((designation) {
                return DropdownMenuItem<String>(
                  value: designation,
                  child: Text(designation),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Designation',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a designation';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add registration logic here
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
