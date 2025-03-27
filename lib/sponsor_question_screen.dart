import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'basf_lab_screen.dart';
import 'globalboolean.dart';
import 'donor_wall_screen.dart';

class SponsorQuestionScreen extends StatefulWidget {
  const SponsorQuestionScreen({super.key});

  @override
  State<SponsorQuestionScreen> createState() => _SponsorQuestionScreenState();
}

class _SponsorQuestionScreenState extends State<SponsorQuestionScreen> {
  bool _isCorrect = false;
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'SponsorQuestionScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'SponsorQuestionScreen';
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
    if (answer == 'BASF') {
      setState(() {
        _isCorrect = true;
        _globalState.donor = true;
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
          'Sponsor Question',
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
              'Which name can you find on the wall?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            if (!_isCorrect) ...[
              _buildAnswerButton('BASF'),
              const SizedBox(height: 16),
              _buildAnswerButton('Dow Chemical'),
              const SizedBox(height: 16),
              _buildAnswerButton('DuPont'),
              const SizedBox(height: 16),
              _buildAnswerButton('3M'),
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
                          builder: (context) => const DonorWallScreen()),
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
