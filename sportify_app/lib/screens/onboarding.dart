import 'package:flutter/material.dart';
import 'signup.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _buildPage('Fair & cheat-proof evaluations.'),
          _buildPage('Gamified progress tracking.'),
          _buildPage('Get noticed by national talent scouts.'),
        ],
      ),
      bottomSheet: SizedBox(
        height: 60,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          child: const Text('Sign Up / Log In'),
        ),
      ),
    );
  }

  Widget _buildPage(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
