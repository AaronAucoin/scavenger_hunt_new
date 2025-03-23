import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';

import 'right_hallway_screen.dart';
import 'globalboolean.dart';

class SustainableLivingLabScreen extends StatefulWidget {
  const SustainableLivingLabScreen({super.key});

  @override
  State<SustainableLivingLabScreen> createState() => _SustainableLivingLabScreenState();
}

class _SustainableLivingLabScreenState extends State<SustainableLivingLabScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'SustainableLivingLabScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'SustainableLivingLabScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuestScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF461D7C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Sustainable Living Lab',
            style: TextStyle(
              color: Color(0xFF461D7C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
              child: const Text(
                'Sustainable Living Lab',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Sustainable Living Lab',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'Go to the right hallway',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RightHallwayScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF461D7C),
                        padding: const EdgeInsets.all(24),
                        shape: const CircleBorder(),
                        elevation: 4,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF461D7C),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Game',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Quests',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
} 