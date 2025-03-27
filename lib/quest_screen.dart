import 'package:flutter/material.dart';
import 'hunt_screen.dart';
import 'map_screen.dart';
import 'globalboolean.dart';
import 'commons_screen.dart';
import 'right_hallway_screen.dart';
import 'basf_lab_screen.dart';
import 'big_stairs_screen.dart';
import 'center_of_engineering_screen.dart';
import 'throne_room_screen.dart';
import 'donor_wall_screen.dart';
import 'sponsor_question_screen.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final int _selectedIndex = 2;
  final GlobalState _globalState = GlobalState();

  Widget _getLastGameScreen() {
    switch (_globalState.lastGameScreen) {
      case 'HuntScreen':
        return const HuntScreen();
      case 'CommonsScreen':
        return const CommonsScreen();
      case 'RightHallwayScreen':
        return const RightHallwayScreen();
      case 'BasfLabScreen':
        return const BasfLabScreen();
      case 'BigStairsScreen':
        return const BigStairsScreen();
      case 'CenterOfEngineeringScreen':
        return const CenterOfEngineeringScreen();
      case 'ThroneRoomScreen':
        return const ThroneRoomScreen();
      case 'DonorWallScreen':
        return const DonorWallScreen();
      case 'SponsorQuestionScreen':
        return const SponsorQuestionScreen();
      default:
        return const HuntScreen();
    }
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _getLastGameScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
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
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Your Quests',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildQuestItem('Order bagel', _globalState.bagel),
            const Divider(color: Colors.white70),
            _buildQuestItem('Find the royal throne', _globalState.throne),
            const Divider(color: Colors.white70),
            _buildQuestItem(
                'Figure out the name of the donor on the Donor wall',
                _globalState.donor),
            const Divider(color: Colors.white70),
            _buildQuestItem(
                'Figure out the sponser of the sustainable living lab',
                _globalState.basf),
            const Divider(color: Colors.white70),
            _buildQuestItem('Find the flier on the wall', _globalState.flier),
            const Divider(color: Colors.white70),
            _buildQuestItem(
                'Count the number of big stairs', _globalState.stairs),
            const Divider(color: Colors.white70),
            _buildQuestItem('Find the cool car', _globalState.car),
            const Divider(color: Colors.white70),
            _buildQuestItem('Find the SUPER BIG crane', _globalState.crane),
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

  Widget _buildQuestItem(String text, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
