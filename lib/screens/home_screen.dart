import 'package:flutter/material.dart';
import 'workout_details_screen.dart';
import '../widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning,', style: TextStyle(fontSize: 16, color: Color(0xFF4B5870))),
                      SizedBox(height: 3),
                      Text('Pramod 👋', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF13253A))),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, size: 28)),
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFD7E7E2),
                  child: Icon(Icons.person, color: Color(0xFF267D68), size: 28),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search workouts, meals, or goals...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF0F5FA),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            _featuredWorkout(context),
            const SizedBox(height: 22),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _QuickAction(icon: Icons.fitness_center, label: 'Workouts', color: Color(0xFFDDF5E9), iconColor: Color(0xFF18876B)),
                _QuickAction(icon: Icons.restaurant, label: 'Nutrition', color: Color(0xFFE2EDFF), iconColor: Color(0xFF5079F5)),
                _QuickAction(icon: Icons.spa, label: 'Mindfulness', color: Color(0xFFFFE5EB), iconColor: Color(0xFFDF5E7C)),
                _QuickAction(icon: Icons.bar_chart, label: 'Progress', color: Color(0xFFFFF0D9), iconColor: Color(0xFFE9A126)),
              ],
            ),
            const SizedBox(height: 26),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Focus", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View All', style: TextStyle(color: Color(0xFF198C6C), fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFE7F5EE), borderRadius: BorderRadius.circular(20)),
              child: const Row(
                children: [
                  CircleAvatar(backgroundColor: Color(0xFFD2EEDD), child: Icon(Icons.track_changes, color: Color(0xFF18876B))),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You're on track!", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Complete your workout and stay consistent.', style: TextStyle(color: Color(0xFF62728A), height: 1.4)),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Recommended Workouts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: WorkoutCard(
                    title: 'HIIT Cardio',
                    subtitle: '20 min • Beginner',
                    imagePath: 'assets/images/hiit.jpg',
                    calories: '220 kcal',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkoutDetailsScreen())),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WorkoutCard(
                    title: 'Morning Yoga',
                    subtitle: '15 min • All Levels',
                    imagePath: 'assets/images/yoga.jpg',
                    calories: '180 kcal',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkoutDetailsScreen())),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavigation(),
    );
  }

  Widget _featuredWorkout(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkoutDetailsScreen())),
      child: Container(
        height: 190,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: const Color(0xFF274D4A)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/workout.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF7EAFAF), Color(0xFF183E3A)]),
                ),
                child: const Icon(Icons.fitness_center, color: Colors.white, size: 70),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                ),
              ),
            ),
            Positioned(
              left: 18,
              right: 18,
              bottom: 18,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FEATURED', style: TextStyle(color: Color(0xFF8DE3C1), fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Full Body Workout', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('30 min  •  Intermediate', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward, color: Color(0xFF198C6C)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;

  const _QuickAction({required this.icon, required this.label, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 29, backgroundColor: color, child: Icon(icon, color: iconColor, size: 27)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Workouts'),
        NavigationDestination(icon: Icon(Icons.restaurant), label: 'Nutrition'),
        NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
