import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'globalboolean.dart';

class FlierScreen extends StatefulWidget {
  const FlierScreen({super.key});

  @override
  State<FlierScreen> createState() => _FlierScreenState();
}

class _FlierScreenState extends State<FlierScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  @override
  void initState() {
    super.initState();
    _globalState.flier = true;
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'FlierScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'FlierScreen';
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
          'Flier Found!',
          style: TextStyle(
            color: Color(0xFF461D7C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Quest completed!\nYou found the flier on the wall!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF461D7C),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
            ),
            child: const Text(
              'Return to Commons',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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