import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String calories;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.calories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFDDEBE5),
                  child: const Icon(Icons.fitness_center, size: 36, color: Color(0xFF25866C)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 5),
                  Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF6C7A90))),
                  const SizedBox(height: 7),
                  Text('🔥 $calories', style: const TextStyle(fontSize: 11, color: Color(0xFF68768B))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
