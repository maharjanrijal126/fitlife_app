import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF8AB8D8), Color(0xFFFFD5A2), Color(0xFF071A20)],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.05),
                  Colors.black.withValues(alpha: 0.12),
                  Colors.black.withValues(alpha: 0.88),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const Icon(Icons.spa, size: 66, color: Color(0xFF38B58B)),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'Fit', style: TextStyle(color: Color(0xFF122432))),
                        TextSpan(text: 'Life', style: TextStyle(color: Color(0xFF38B58B))),
                      ],
                    ),
                  ),
                  const Text(
                    'Better Health  •  Happier You',
                    style: TextStyle(fontSize: 16, color: Color(0xFF122432)),
                  ),
                  const Spacer(flex: 5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Small Steps\nBig Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your journey to a healthier\nand stronger you starts here.',
                      style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF35B58B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Get Started', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login screen can be added next.')),
                          );
                        },
                        child: const Text('Log In', style: TextStyle(color: Color(0xFF48D3A6), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
