import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'crane_quest_completion_screen.dart';
import 'big_stairs_screen.dart';
import 'donor_wall_screen.dart';
import 'globalboolean.dart';
import 'right_hallway_screen.dart';

class AppDudeRoom extends StatefulWidget {
  const AppDudeRoom({super.key});

  @override
  State<AppDudeRoom> createState() => _AppDudeRoomState();
}

class _AppDudeRoomState extends State<AppDudeRoom> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();
  final TextEditingController _answerController = TextEditingController();
  String? _feedbackText;
  bool _isCorrect = false;

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'AppDudeRoomScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'AppDudeRoom';
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

  void _checkAnswer() {
    setState(() {
      if (_answerController.text.trim() == '1221') {
        _feedbackText =
            'Correct! The room number is 1221.\nThis task has been checked off your checklist.';
        _isCorrect = true;
        _globalState.appDudeRoom = true;
      } else {
        _feedbackText = 'Try again!';
        _isCorrect = false;
      }
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "David Shepherd's Classroom",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF461D7C),
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You have found the room where David Shepherd teaches CSC 4330. 10/10 professor would highly recommend taking his class.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/appduderoom.png',
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'What is the room number?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _answerController,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter room number',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                    onSubmitted: (_) => _checkAnswer(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF461D7C),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          if (_feedbackText != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                _feedbackText!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      color: _isCorrect ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: Text(
                'Return to Right Hallway',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                    ),
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
