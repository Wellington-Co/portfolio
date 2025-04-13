import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'title': 'Flutter & Dart',
        'description': 'Cross-platform app development with modern UI and animations.',
      },
      {
        'title': 'Web Design & Development',
        'description': 'HTML, CSS, JavaScript, Node.js, and responsive design principles.',
      },
      {
        'title': 'Cybersecurity',
        'description': 'Basic encryption, security best practices, and secure system design.',
      },
      {
        'title': 'UI/UX Design',
        'description': 'Building beautiful, intuitive interfaces with user-focused design.',
      },
      {
        'title': 'Database Management',
        'description': 'Experience with MySQL, Firebase, and relational database modeling.',
      },
    ];

    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
  backgroundColor: Colors.black87,
  automaticallyImplyLeading: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "My Skills",
        style: TextStyle(color: Colors.white),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: const Text(
          "Wellingtone",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.amberAccent,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Technical Skills",
              style: TextStyle(
                fontSize: 32,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Here’s a snapshot of my core skill set and technical strengths.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: skills
                  .map(
                    (skill) => SkillCard(
                      title: skill['title'] as String,
                      description: skill['description'] as String,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final String title;
  final String description;

  const SkillCard({super.key, required this.title, required this.description});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width < 600 ? double.infinity : 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? Colors.amber.shade800 : Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
