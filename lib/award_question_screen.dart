import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'awardCabinet.dart';
import 'globalboolean.dart';

class AwardQuestionScreen extends StatefulWidget {
  const AwardQuestionScreen({super.key});

  @override
  State<AwardQuestionScreen> createState() => _AwardQuestionScreenState();
}

class _AwardQuestionScreenState extends State<AwardQuestionScreen> {
  bool _isCorrect = false;
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'AwardQuestionScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'AwardQuestionScreen';
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

  void _checkAnswer(String answer) {
    if (answer == '2023') {
      setState(() {
        _isCorrect = true;
        _globalState.award = true;
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
          'Award Question',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF461D7C),
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What year is the most recent award?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            if (!_isCorrect) ...[
              _buildAnswerButton('2023'),
              const SizedBox(height: 16),
              _buildAnswerButton('2022'),
              const SizedBox(height: 16),
              _buildAnswerButton('2021'),
              const SizedBox(height: 16),
              _buildAnswerButton('2020'),
            ],
            if (_isCorrect) ...[
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'This task has been checked off your checklist!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Return to Game',
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AwardCabinetScreen()),
                    );
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
                  child: const Text(
                    'Return to Game',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }

  Widget _buildAnswerButton(String answer) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _checkAnswer(answer),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF461D7C),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
        ),
        child: Text(
          answer,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                color: Color(0xFF461D7C),
              ),
        ),
      ),
    );
  }
}
