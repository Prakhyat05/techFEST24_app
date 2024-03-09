import 'package:flutter/material.dart';

class ChemicaDomainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chemica Domain'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DomainButton(
                eventName: 'Application of Lithium Battery',
                color: Colors.blue,
              ),
              SizedBox(height: 10.0),
              DomainButton(
                eventName: 'Chemi-Storm',
                color: Colors.orange,
              ),
              SizedBox(height: 10.0),
              DomainButton(
                eventName: 'Soap and Perfume Fragrance Making',
                color: Colors.green,
              ),
              SizedBox(height: 10.0),
              DomainButton(
                eventName: 'Jam Session',
                color: Colors.purple,
              ),
              SizedBox(height: 10.0),
              DomainButton(
                eventName: 'Chemi-Mystery',
                color: Colors.indigo,
              ),
              SizedBox(height: 10.0),
              DomainButton(
                eventName: 'Poster and Paper Presentation',
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DomainButton extends StatelessWidget {
  final String eventName;
  final Color color;

  const DomainButton({required this.eventName, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add onPressed functionality here
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        eventName,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
