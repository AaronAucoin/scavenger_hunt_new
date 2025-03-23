import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'basf_lab_screen.dart';
import 'globalboolean.dart';
import 'commons_screen.dart';

class RightHallwayScreen extends StatefulWidget {
  const RightHallwayScreen({super.key});

  @override
  State<RightHallwayScreen> createState() => _RightHallwayScreenState();
}

class _RightHallwayScreenState extends State<RightHallwayScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'RightHallwayScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'RightHallwayScreen';
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
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Right Hallway',
          style: TextStyle(
            color: Color(0xFF461D7C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/righthallway.png',
                height: 300,
                width: 300,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const Center(
                    child: Text(
                      'Logo not found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
            child: Text(
              'Proceed down the hallway...',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Proceed to the BASF LAB',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasfLabScreen()),
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
                      Icons.arrow_upward,
                      size: 32,
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Back to Commons Area',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CommonsScreen()),
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
                      Icons.arrow_downward,
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
    );
  }
}
