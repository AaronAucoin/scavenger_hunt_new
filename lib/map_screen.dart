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
import 'compLab.dart';
import 'app_dude_room.dart';
import 'comp_lab_hall_screen.dart';
import 'awardsHall.dart';
import 'awardCabinet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final int _selectedIndex = 1;
  final GlobalState _globalState = GlobalState();
  final TransformationController _transformationController =
      TransformationController();

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
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF461D7C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Map',
            style: TextStyle(
              color: Color(0xFF461D7C),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            Tooltip(
              message: 'Pick a button to teleport to that location',
              child: Icon(
                Icons.help_outline,
                color: Color(0xFF461D7C),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      minScale: 0.5,
                      maxScale: 4.0,
                      boundaryMargin: const EdgeInsets.all(0),
                      clipBehavior: Clip.hardEdge,
                      child: Center(
                        child: GestureDetector(
                          onDoubleTap: () {
                            _transformationController.value =
                                Matrix4.identity();
                          },
                          child: Image.asset(
                            'assets/pftMap.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading map: $error');
                              return const Center(
                                child: Text(
                                  'Map not found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InteractiveViewer(
                      transformationController: TransformationController(),
                      minScale: 0.5,
                      maxScale: 4.0,
                      boundaryMargin: const EdgeInsets.all(0),
                      clipBehavior: Clip.hardEdge,
                      child: Center(
                        child: GestureDetector(
                          onDoubleTap: () {
                            _transformationController.value =
                                Matrix4.identity();
                          },
                          child: Image.asset(
                            'assets/pft2floor.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading second map: $error');
                              return const Center(
                                child: Text(
                                  'Second map not found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.white.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // 1st Floor Section
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '1st Floor',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _buildNavButton(
                        context,
                        Icons.arrow_forward,
                        'Right Hallway',
                        const RightHallwayScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.table_restaurant,
                        'Commons Area',
                        const CommonsScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.engineering,
                        'Center of Engineering',
                        const CenterOfEngineeringScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.stairs,
                        'Big Stairs',
                        const BigStairsScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.wallpaper,
                        'Donor Wall',
                        const DonorWallScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.science,
                        'BASF Lab',
                        const BasfLabScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.code,
                        'App Dude Room',
                        const AppDudeRoom(),
                      ),
                      const SizedBox(height: 12),
                      // 2nd Floor Section
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '2nd Floor',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _buildNavButton(
                        context,
                        Icons.meeting_room,
                        'Computer Lab Hall',
                        const CompLabHallScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.computer,
                        'Computer Lab',
                        const CompLabScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.code,
                        'Awards Hall',
                        const AwardsHallScreen(),
                      ),
                      const SizedBox(height: 12),
                      _buildNavButton(
                        context,
                        Icons.code,
                        'Awards Cabinet',
                        const AwardCabinetScreen(),
                      ),
                    ],
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
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    IconData icon,
    String label,
    Widget destination,
  ) {
    return Tooltip(
      message: 'Go to $label',
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.9),
          foregroundColor: const Color(0xFF461D7C),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
