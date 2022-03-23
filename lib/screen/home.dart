import 'package:flutter/material.dart';
import 'package:medecin_gsb/main.dart';
import 'package:medecin_gsb/screen/pays.dart';
import '../main.dart';
import 'departements.dart';
import 'medecinSearch.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  // Avoiding state-related errors
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:const <Widget>[
          MedecinSearchScreen(),
          PaysScreen(),
          DepartementsScreen(),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.jumpToPage(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Recherche nom",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: "Pays",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: "Départements",
          ),
        ],
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
      ),
    );
  }
}

/*
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
}*/
