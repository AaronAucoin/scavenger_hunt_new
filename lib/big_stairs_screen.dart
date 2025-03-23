import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'throne_room_screen.dart';
import 'commons_screen.dart';
import 'center_of_engineering_screen.dart';
import 'race_car_screen.dart';
import 'globalboolean.dart';

class BigStairsScreen extends StatefulWidget {
  const BigStairsScreen({super.key});

  @override
  State<BigStairsScreen> createState() => _BigStairsScreenState();
}

class _BigStairsScreenState extends State<BigStairsScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'BigStairsScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'BigStairsScreen';
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
        // Only allow back navigation if we're not on a main tab
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF461D7C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Big Stairs',
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
                'The Big Stairs are a great place to work on homework and hang out with friends!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // This Expanded ensures the image is centered between the texts
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bigstair.png',
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
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Text(
                'Where do you want to go next?',
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
                    message: 'Check out the race car',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RaceCarScreen()),
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
                    message: 'Turn around',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CenterOfEngineeringScreen()),
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
                        Icons.rotate_left,
                        size: 32,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Navigate past the stairs to the commons',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CommonsScreen()),
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
                  Tooltip(
                    message: 'Secret Throne Room',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThroneRoomScreen()),
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
                        Icons.help_outline,
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
