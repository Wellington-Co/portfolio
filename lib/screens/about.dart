import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellingtone/widgets/footer.dart';
import 'package:wellingtone/widgets/drawer.dart';
import 'package:wellingtone/widgets/section_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void _downloadResume() async {
    const url = 'https://drive.google.com/file/d/11UMLz4XzfDV5T5oA-aYF4a2BQX2uv5Ja/view?usp=sharing'; //  resume URL
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              color: Colors.black,
              child: Column(
                children: const [
                  Text(
                    "Wellingtone Omondi Otieno",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 12,
                          color: Colors.amberAccent,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Software Developer | Tech Educator | Startup Founder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Who I Am
            SectionContainer(
              title: 'Who I Am',
              description:
                  'I am a passionate and self-driven software developer and educator with a strong foundation in web and mobile development. As the founder of Neton Apex Enterprises, I focus on building impactful tech solutions across fintech, education, and healthcare sectors. My core strength lies in turning complex problems into clean, functional, and user-centric digital experiences.',
            ),

            // Mission
            SectionContainer(
              title: 'My Mission',
              description:
                  'To use technology as a tool for solving real-world problems, empowering businesses, and inspiring a new generation of developers through education and innovation.',
            ),

            // Core Values
            SectionContainer(
              title: 'Core Values',
              description:
                  '- Innovation\n- Excellence\n- Reliability\n- Empathy\n- Lifelong Learning',
            ),

            // Fun Facts
            SectionContainer(
              title: 'Fun Facts',
              description:
                  '🎭 I have a deep love for theater and literature.\n🎧 Music fuels my focus.\n🎮 I unwind with a bit of retro gaming.\n✈️ Dreaming of coding while traveling the world.',
            ),

            // Education
            SectionContainer(
              title: 'Education',
              description:
                  'Currently pursuing a B.Ed. in Special Needs Education at Kisii University. I’ve completed the Safaricom Digital Talent Program (PLP) and specialized coding bootcamps in Flutter, Node.js, and cybersecurity.',
              buttonLabel: 'Download Resume',
              onPressed: _downloadResume,
            ),

            // Career
            SectionContainer(
              title: 'Career',
              description:
                  'I’ve served as a freelance web developer, customer support agent at an ISP, and frontend developer on projects like payment systems, e-learning platforms, and SaaS tools.',
              routeName: '/career',
            ),

            // Projects
            SectionContainer(
              title: 'Projects',
              description:
                  'Projects include Neton Pay (payment API), NetonCare (telehealth), Neton Prime Link (ISP site), and Wellingtone Luxe Retreat (resort site). All are built with clean UI/UX and responsive design.',
              routeName: '/projects',
            ),

            // Skills
            SectionContainer(
              title: 'Skills',
              description:
                  'Languages & Tools: Flutter, Dart, HTML, CSS, JavaScript, Node.js, MySQL, Firebase\nOther: API integration, cybersecurity basics, STK push, system architecture design',
              routeName: '/skills',
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
