import 'package:flutter/material.dart';

import 'Domains/DomainPage.dart';
import 'Services/Auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum CoordinatorType {
  Domain("Domain"),
  Event("Event"),
  Faculty("Faculty");

  final String label;

  const CoordinatorType(this.label);

}

class _RegisterPageState extends State<RegisterPage> {
  //create the controllers
  String? _selectedDesignation;
  List<Domain>? domains;
  List<String> _designations = [
    'Core Coordinator',
    'Domain Coordinator',
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmpasswordController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController eventController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Domain.getAll().then((value) => (ds) {
      domains = ds;
    });
    Domain? d;
    List<Event>? events;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      //for the form to be in center
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Name'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              //some space between name and email
              const SizedBox(
                height: 10,
              ),
              const Text('Email'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
              //some space between email and mobile
              const SizedBox(
                height: 10,
              ),
              const Text('Mobile'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Mobile',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Type'),
              const SizedBox(
                height: 5,
              ),
              DropdownMenu<CoordinatorType>(
                initialSelection:CoordinatorType.Domain,
                controller: typeController,
                requestFocusOnTap: true,
                label: const Text('Coordinator Type'),
                dropdownMenuEntries: CoordinatorType.values
                    .map<DropdownMenuEntry<CoordinatorType>>(
                        (CoordinatorType color) {
                      return DropdownMenuEntry<CoordinatorType>(
                        value: color,
                        label: color.label,
                        enabled: color.label != 'Grey',
                      );
                    }).toList(),

              )
              ,
              const SizedBox(
                height: 10,
              ),
              const Text('Password'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Confirm Password'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: ConfirmpasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirm Password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Designation'),
              SizedBox(height: 5.0),
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
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Domain'),
              SizedBox(height: 5.0),
              DropdownButtonFormField<Domain>(
                value: d,
                onChanged: (domain) {
                  setState(() async {
                    if (domain != null) {
                      events = await Event.getAll(domain);
                    };
                  });
                },
                items: (domains ?? []).map((domain) {
                  return DropdownMenuItem<Domain>(
                    value: domain,
                    child: Text(domain.domainName),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select Domain',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a designation';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Event'),
              SizedBox(height: 5.0),
          (d != null) ? const SizedBox(height: 5.0) : DropdownButtonFormField<String>(
                value: _selectedDesignation,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDesignation = newValue!;
                  });
                },
                items: (events ?? []).map((event) {
                  return DropdownMenuItem<String>(
                    value: event.eventName,
                    child: Text(event.eventName),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select Domain',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a designation';
                  }
                  return null;
                },
              ),
              //create button for register
              ElevatedButton(
                onPressed: () {
                  //we will trying to print input
                  print(nameController.text);
                  print(emailController.text);
                  print(mobileController.text);
                  print(passwordController.text);
                  print(ConfirmpasswordController.text);
                  String? domain;
                  String? event;
                  if (typeController.text == "Domain") {
                    domain = domainController.text;
                  }
                  if (typeController.text == "Event") {
                    domain = domainController.text;
                    event = eventController.text;
                  }
                  Auth().SignUp(SignupInfo(name: nameController.text, mail: emailController.text, phone: mobileController.text, branch: branchController.text, type: typeController.text, domain: domain, event: event));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
