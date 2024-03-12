import 'dart:math';

import 'package:flutter/material.dart';

import '../Services/Auth.dart';
import 'DomainPage.dart';

class UserPage extends StatelessWidget {
  Event? event;
  Workshop? workshop;
  UserPage({super.key, this.event, this.workshop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 160,
          height: 100,
          child: Image.asset("assets/techfest24 name.png"),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: event?.individual.length ?? workshop?.user.length ?? 0,
              itemBuilder: (_, i) {
                return UserRecord(
                    user: event?.individual[i] ?? workshop!.user[i],
                    event: event);
              })),
    );
  }
}

class UserRecord extends StatelessWidget {
  final User user;
  Event? event;
  Workshop? workshop;

  UserRecord({super.key, required this.user, this.event, this.workshop});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(user.name),
      Text(user.regNo),
      Text(user.userId),
      ElevatedButton(
        onPressed: () {
          Auth().verifyAttendance(user, event, workshop);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue, // text color
          padding: const EdgeInsets.all(20.0),
        ),
        child: const Text(
          "Verify Attendance",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      )
    ]);
  }
}
