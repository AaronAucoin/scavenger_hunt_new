import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'quest_screen.dart';
import 'throne_room_screen.dart';
import 'commons_screen.dart';
import 'center_of_engineering_screen.dart';
import 'race_car_screen.dart';
import 'globalboolean.dart';
import 'comp_lab_hall_screen.dart';

class BigStairsScreen extends StatefulWidget {
  const BigStairsScreen({super.key});

  @override
  State<BigStairsScreen> createState() => _BigStairsScreenState();
}

class _BigStairsScreenState extends State<BigStairsScreen> {
  int _selectedIndex = 0;
  final GlobalState _globalState = GlobalState();
  final TextEditingController _answerController = TextEditingController();
  String? _feedbackText;
  bool _isCorrect = false;

  void _onItemTapped(int index) {
    if (index == 1) {
      _globalState.lastGameScreen = 'BigStairsScreen';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else if (index == 2) {
      _globalState.lastGameScreen = 'BigStairsScreen';
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
      if (_answerController.text.trim() == '11') {
        _feedbackText =
            'Correct! There are 11 stairs.\nThis task has been checked off your checklist.';
        _isCorrect = true;
        _globalState.stairs = true;
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
    return WillPopScope(
      onWillPop: () async {
        // Only allow back navigation if we're not on a main tab
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF461D7C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Big Stairs',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color(0xFF461D7C),
                ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
              child: Text(
                'The Big Stairs are a great place to work on homework and hang out with friends!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // This Expanded ensures the image is centered between the texts
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bigstair.png',
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'How many stairs are there?',
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
                        hintText: 'Enter number',
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
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Text(
                'Where do you want to go next?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  // Tooltip(
                  //   message: 'Check out the race car',
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const RaceCarScreen()),
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.white,
                  //       foregroundColor: const Color(0xFF461D7C),
                  //       padding: const EdgeInsets.all(24),
                  //       shape: const CircleBorder(),
                  //       elevation: 4,
                  //     ),
                  //     child: const Icon(
                  //       Icons.car_rental_outlined,
                  //       size: 32,
                  //     ),
                  //   ),
                  // ),
                  Tooltip(
                    message: 'Turn around',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CenterOfEngineeringScreen()),
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
                    message: 'Navigate past the stairs to the commons',
                    child: ElevatedButton(
                      onPressed: () {
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
                        Icons.arrow_upward,
                        size: 32,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Go to the 2nd floor',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompLabHallScreen()),
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
                        Icons.stairs,
                        size: 32,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Secret Throne Room',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThroneRoomScreen()),
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
      ),
    );
  }
}
