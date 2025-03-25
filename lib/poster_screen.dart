import 'package:flutter/material.dart';
import 'commons_screen.dart';
import 'globalboolean.dart';

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Poster',
          style: TextStyle(
            color: Color(0xFF461D7C),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF461D7C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
              child: Text(
                'You found the flier!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            Image.asset(
              'assets/commonsflier.png',
              height: 300,
              width: 300,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
              child: Text(
                'This task has been checked off your checklist.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            Tooltip(
              message: 'Return to Commons',
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommonsScreen()),
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
                child: const Text(
                  'Return to Commons',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
