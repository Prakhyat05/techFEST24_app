import 'package:flutter/material.dart';
import 'package:techfest_24/Domains/Chemica.dart';
import 'package:techfest_24/Domains/Electrica.dart';
import 'package:techfest_24/Domains/Electronica.dart';
import 'package:techfest_24/Domains/Food_O_Crats.dart';
import 'package:techfest_24/Domains/Genesis.dart';
import 'package:techfest_24/Domains/Karyarachna.dart';
import 'package:techfest_24/Domains/Kermis.dart';
import 'package:techfest_24/Domains/Mechanica.dart';
import 'package:techfest_24/Domains/Plexus.dart';
import 'package:techfest_24/Domains/Robozar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 160,
          height: 100,
          child: Image.asset("assets/techfest24 name.png"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            CustomButton(title: 'Mechanica'),
            CustomButton(title: 'Food - o - Crats'),
            CustomButton(title: 'Atomheimer'),
            CustomButton(title: 'Genesis'),
            CustomButton(title: 'Kermis'),
            CustomButton(title: 'Karyarachna'),
            CustomButton(title: 'Chemica'),
            CustomButton(title: 'Electrica'),
            CustomButton(title: 'Plexus'),
            CustomButton(title: 'Electronica'),
            CustomButton(title: 'Robozar'),
            CustomButton(title: 'Aarambh'),
            CustomButton(title: 'Venture Vault'),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;

  const CustomButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (title == "Plexus") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PlexusDomainPage()));
        } else if (title == "Mechanica") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => MechanicaDomainPage()));
        } else if (title == "Chemica") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ChemicaDomainPage()));
        } else if (title == "Electronica") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ElectronicaDomainPage()));
        } else if (title == "Electrica") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ElectricaDomainPage()));
        } else if (title == "Food - o - Crats") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => FoodDomainPage()));
        } else if (title == "Genesis") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => GenesisDomainPage()));
        } else if (title == "Karyarachna") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => KaryarachnaDomainPage()));
        } else if (title == "Kermis") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => KermisDomainPage()));
        } else if (title == "Robozar") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RobozarDomainPage()));
        } else if (title == "Atomheimer") {
          print("Comming Soon");
        } else if (title == "Aarambh") {
          print("Comming Soon");
        } else if (title == "Venture Vault") {
          print("Comming Soon");
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // background color
        onPrimary: Colors.white, // text color
        padding: EdgeInsets.all(20.0),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
