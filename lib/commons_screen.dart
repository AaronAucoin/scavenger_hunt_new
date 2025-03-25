import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'poster_screen.dart';
import 'right_hallway_screen.dart';
import 'big_stairs_screen.dart';
import 'globalboolean.dart';
import 'flier_screen.dart';

class CommonsScreen extends StatefulWidget {
  const CommonsScreen({super.key});

  @override
  State<CommonsScreen> createState() => _CommonsScreenState();
}

class _CommonsScreenState extends State<CommonsScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'CommonsScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'CommonsScreen';
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
          'Commons Area',
          style: TextStyle(
            color: Color(0xFF461D7C),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.help_outline,
              color: Color(0xFF461D7C),
            ),
            onSelected: (value) {
              // Handle menu item selection
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'about',
                child: Text('About the Commons'),
              ),
              const PopupMenuItem<String>(
                value: 'rules',
                child: Text('Scavenger Hunt Rules'),
              ),
              const PopupMenuItem<String>(
                value: 'help',
                child: Text('Need Help?'),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
            child: const Text(
              'The Commons Area has lots of tables that you can sit at to study and socialize! What else could be found here...?',
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
              mainAxisAlignment: MainAxisAlignment.center, // Centers the image
              children: [
                Image.asset(
                  'assets/commons.png',
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
                  message: 'Navigate to the stair way',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BigStairsScreen()),
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
                  message: 'Turn around to see the flier',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FlierScreen()),
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
                  message: 'Inspect the pole',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PosterScreen()),
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
                      Icons.search,
                      size: 32,
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Navigate to the right hallway',
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
    );
  }
}
