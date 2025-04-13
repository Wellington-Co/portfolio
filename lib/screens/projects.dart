import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Wellingtone Lux Retreat',
        'description':
            'A luxury resort website designed to capture the essence of serenity and sophistication. This project features a modern, responsive layout with rich visuals, showcasing exquisite accommodations, gourmet dining, and premium wellness experiences.',
        'image': 'assets/images/luxretreat.png',
        'url': 'https://luxretreat.netlify.app/',
      },
      {
        'title': 'Neton Prime Link',
        'description':
            'A modern, responsive site showcasing wireless solutions, Wi-Fi packages, CCTV services, and connectivity tools under Neton Apex Enterprises. Built for clarity, speed, and easy client access.',
        'image': 'assets/images/primelink.png',
        'url': 'https://netonprimelink.netlify.app/',
      },
      {
        'title': 'NetonCare',
        'description':
            'A telemedicine and emergency platform for accessing affordable healthcare services.',
        'image': 'assets/images/netoncare.png',
        'url': 'https://netoncare.netlify.app/',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: const Text(
                'Wellingtone',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            const Text(
              "My Projects",
              style: TextStyle(
                fontSize: 32,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Here are some of the projects I've worked on recently.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: projects.map((project) {
                return ProjectCard(
                  title: project['title'] as String,
                  description: project['description'] as String,
                  imagePath: project['image'] as String,
                  url: project['url'] as String,
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final String url;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.url,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  void launchProjectURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch project link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double cardWidth = isMobile ? double.infinity : 300;
    final double cardHeight = 420;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imagePath,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.description,
                style: const TextStyle(color: Colors.white70),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => launchProjectURL(widget.url),
                child: const Text("View Live"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
