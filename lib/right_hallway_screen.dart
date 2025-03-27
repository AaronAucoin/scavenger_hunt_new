import 'package:flutter/material.dart';
import 'package:scavenger_hunt_new/app_dude_room.dart';
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
        title: Text(
          'Right Hallway',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF461D7C),
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 24.0),
            child: Column(
              children: [
                Text(
                  'The Right Hallway',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Proceed down the hallway to discover what lies ahead...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/righthallway.png',
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
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Text(
              'Choose your direction',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.3,
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
                  message: 'Back to Commons Area',
                  child: ElevatedButton(
                    onPressed: () {
                      _globalState.lastGameScreen = 'CommonsScreen';
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
                      Icons.arrow_downward,
                      size: 32,
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Proceed to basf lab',
                  child: ElevatedButton(
                    onPressed: () {
                      _globalState.lastGameScreen = 'BASFLabScreen';
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
                  message: 'Go to App Dude Room',
                  child: ElevatedButton(
                    onPressed: () {
                      _globalState.lastGameScreen = 'AppDudeRoom';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppDudeRoom()),
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
    );
  }
}
