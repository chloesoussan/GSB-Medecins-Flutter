import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medecin_gsb/screen/pays.dart';

import 'departements.dart';
import 'medecinSearch.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('GSB Médecin - Accueil'),
    ),
    body: Center(
    child: Column(
      children: [
        ElevatedButton(
        child: const Text('Pays'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaysScreen()),
          );
        // Navigate to second route when tapped.
        },
        ),
        ElevatedButton(
          child: const Text('Départements'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DepartementsScreen())
            );
            // Navigate to second route when tapped.
          },
        ),
        ElevatedButton(
          child: const Text('Recherche de médecins par nom'),
          onPressed: () {
            Navigator.push(
                context,
            MaterialPageRoute(builder: (context) => const MedecinSearchScreen()));
            // Navigate to second route when tapped.
          },
        ),
      ],
    ),
    ),
    );
  }
}