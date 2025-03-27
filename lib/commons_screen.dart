import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'poster_screen.dart';
import 'right_hallway_screen.dart';
import 'big_stairs_screen.dart';
import 'globalboolean.dart';

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
        title: Text(
          'Commons Area',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF461D7C),
                fontWeight: FontWeight.w400,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 24.0),
            child: Column(
              children: [
                Text(
                  'The Commons Area',
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
                  'Lots of tables that you can sit at to study and socialize! What else could be found here...?',
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
                  'assets/commons.png',
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
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Text(
              'Where do you want to go next?',
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
                  message: 'Navigate to the stair way',
                  child: ElevatedButton(
                    onPressed: () {
                      _globalState.lastGameScreen = 'BigStairsScreen';
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
                  message: 'Inspect',
                  child: ElevatedButton(
                    onPressed: () {
                      _globalState.lastGameScreen = 'PosterScreen';
                      GlobalState().flier = true;
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
                      _globalState.lastGameScreen = 'RightHallwayScreen';
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
