import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'globalboolean.dart';

class RaceCarScreen extends StatefulWidget {
  const RaceCarScreen({super.key});

  @override
  State<RaceCarScreen> createState() => _RaceCarScreenState();
}

class _RaceCarScreenState extends State<RaceCarScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  @override
  void initState() {
    super.initState();
    _globalState.car = true;
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'RaceCarScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'RaceCarScreen';
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
          title: Text(
            'Cool Race Car',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color(0xFF461D7C),
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'You found the cool race car!',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        'assets/coolcar.png',
                        height: 300,
                        width: 300,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return const Center(
                            child: Text(
                              'Poster image not found',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'This task has been checked off your checklist.',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(), // Push everything above upwards
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 32.0), // Space from the bottom
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF461D7C),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Return to Big Stairs',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ],
          ),
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
