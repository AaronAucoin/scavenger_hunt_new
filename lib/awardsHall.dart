import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'globalboolean.dart';
import 'compLab.dart';
import 'race_car_screen.dart';
import 'awardCabinet.dart';

class AwardsHallScreen extends StatefulWidget {
  const AwardsHallScreen({super.key});

  @override
  State<AwardsHallScreen> createState() => _AwardsHallState();
}

class _AwardsHallState extends State<AwardsHallScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'AwardsHallScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'AwardsHallScreen';
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
        title: Text(
          'Awards Hall',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF461D7C),
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
            child: Text(
              'Welcome to the Awards Hall',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/awardHall.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return const Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
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
                  message: 'Return to Computer Lab',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompLabScreen()),
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
                Tooltip(
                  message: 'KEEP GOING!!!!',
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
                  message: 'See awards',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AwardCabinetScreen()),
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
                      Icons.arrow_right,
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
