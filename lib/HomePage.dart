import 'dart:math';

import 'package:flutter/material.dart';

import 'Domains/DomainPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Domain>> domains = Domain.getAll();
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
        child: FutureBuilder<List<Domain>>(
            future: domains,
            initialData: const [],
            builder:
                (BuildContext context, AsyncSnapshot<List<Domain>> snapshot) {
              if (snapshot.data == null) {
                print(snapshot);
                return const Text("No response from server");
              }
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_, i) {
                    return CustomButton(
                        domain: snapshot.data![i]);
                  });
            }),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Domain domain;

  const CustomButton({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DomainPage(
                      domain: domain,
                    )));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // text color
        padding: const EdgeInsets.all(20.0),
      ),
      child: Text(
        domain.domainName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
