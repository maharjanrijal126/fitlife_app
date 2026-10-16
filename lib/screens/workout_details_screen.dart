import 'package:flutter/material.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  const WorkoutDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = ['Jumping Jacks', 'High Knees', 'Mountain Climbers', 'Burpees'];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 245,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/hiit.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFB8D3CF),
                      child: const Icon(Icons.fitness_center, size: 70),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
                    ),
                  ),
                  const Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.favorite_border)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                children: [
                  const Text('HIIT Cardio', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF13253A))),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.deepOrange),
                      SizedBox(width: 5),
                      Text('220 kcal'),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, color: Color(0xFF62728A)),
                      SizedBox(width: 5),
                      Text('20 min'),
                      SizedBox(width: 16),
                      Icon(Icons.bar_chart, color: Color(0xFF62728A)),
                      SizedBox(width: 5),
                      Text('Beginner'),
                    ],
                  ),
                  const SizedBox(height: 26),
                  const Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'A high-intensity interval training (HIIT) workout designed to boost your metabolism, improve endurance, and burn calories. No equipment needed. Just your body and determination!',
                    style: TextStyle(fontSize: 14, height: 1.55, color: Color(0xFF62728A)),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Exercises', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('See All', style: TextStyle(color: Color(0xFF198C6C), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(exercises.length, (index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFD8F5D4),
                        child: Text('${index + 1}', style: const TextStyle(color: Color(0xFF1C684E), fontWeight: FontWeight.bold)),
                      ),
                      title: Text(exercises[index], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      subtitle: const Text('1 min'),
                      trailing: const Icon(Icons.chevron_right),
                    );
                  }),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFFE7F5EE), borderRadius: BorderRadius.circular(18)),
                    child: const Row(
                      children: [
                        CircleAvatar(backgroundColor: Color(0xFFD2EEDD), child: Icon(Icons.fitness_center, color: Color(0xFF18876B))),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('What You Need', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text('Just your body. No equipment required!', style: TextStyle(color: Color(0xFF62728A))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF269B78),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Workout started!')),
                        );
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Start Workout', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
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
