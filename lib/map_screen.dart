import 'package:flutter/material.dart';
import 'hunt_screen.dart';
import 'quest_screen.dart';
import 'globalboolean.dart';
import 'commons_screen.dart';
import 'right_hallway_screen.dart';
import 'basf_lab_screen.dart';
import 'big_stairs_screen.dart';
import 'center_of_engineering_screen.dart';
import 'throne_room_screen.dart';
import 'donor_wall_screen.dart';
import 'sponsor_question_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final int _selectedIndex = 1;
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
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuestScreen()),
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
        body: const Center(
          child: Text(
            'Map Screen Content',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
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
