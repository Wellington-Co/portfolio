import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final String description;
  final String? routeName;
  final String? buttonLabel;
  final VoidCallback? onPressed;

  const SectionContainer({
    Key? key,
    required this.title,
    required this.description,
    this.routeName,
    this.buttonLabel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900], // Dark background for contrast
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            if (onPressed != null && buttonLabel != null)
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                child: Text(buttonLabel!),
              ),
            if (routeName != null && routeName!.isNotEmpty)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, routeName!),
                child: const Text(
                  'Learn More',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
