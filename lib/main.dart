import 'package:flutter/material.dart';
import 'hunt_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      theme: ThemeData(
        fontFamily: 'proximanova_regular', // Updated font name
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
          bodyMedium:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
          bodySmall:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
          titleLarge:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
          titleMedium:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
          titleSmall:
              TextStyle(fontFamily: 'proximanova_regular', fontWeight: FontWeight.w400),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'proximanova_regular',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0xFF461D7C),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: 'proximanova_regular',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontFamily: 'proximanova_regular',
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'proximanova_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF461D7C), // LSU Purple
          secondary: const Color(0xFFFFB81C), // LSU Gold
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C), // LSU Purple
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PFT Scavenger Hunt',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400, // Changed to normal weight
                  color: Colors.white,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/lsuLogo2.png',
                  height: 180,
                  width: 270,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: \$error');
                    return const Center(
                      child: Text(
                        'Logo not found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HuntScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB81C), // LSU Gold
                    foregroundColor: const Color(0xFF461D7C), // LSU Purple
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400, // Changed to normal weight
                      letterSpacing: 0.5,
                    ),
                  ),
                  child: const Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
