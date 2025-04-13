import 'package:flutter/material.dart';
import 'package:wellingtone/widgets/footer.dart';
import 'package:wellingtone/widgets/drawer.dart';
import 'package:wellingtone/widgets/section_container.dart';
import 'package:url_launcher/url_launcher.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
  backgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.white),
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(),
      GestureDetector(
        onTap: () async {
          final Uri whatsappUrl = Uri.parse('https://wa.me/254743714202');
          if (await canLaunch(whatsappUrl.toString())) {
            await launch(whatsappUrl.toString());
          } else {
            throw 'Could not launch $whatsappUrl';
          }
        },
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
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 800;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _AnimatedReveal(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/me.jpg',
                                  height: 240,
                                  width: 240,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _AnimatedReveal(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Hi, I\'m Wellingtone ',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Flutter Dev • Tech Founder • Special Needs Educator\n• Web Designer • Creative Thinker \nI build smart, scalable, and beautiful solutions.',
                                    style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 10,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      _heroButton('My Resume', () {}),
                                      _heroButton('View Projects', () {
                                        Navigator.pushNamed(context, '/projects');
                                      }),
                                      _heroButton('Contact Me', () {
                                        Navigator.pushNamed(context, '/contact');
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: _AnimatedReveal(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Hi, I\'m Wellingtone 👋',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Flutter Dev • Tech Founder • Creative Thinker\nI build smart, scalable, and beautiful solutions.',
                                      style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                                    ),
                                    const SizedBox(height: 20),
                                    Wrap(
                                      spacing: 12,
                                      children: [
                                        _heroButton('My Resume', () {}),
                                        _heroButton('View Projects', () {
                                          Navigator.pushNamed(context, '/projects');
                                        }),
                                        _heroButton('Contact Me', () {
                                          Navigator.pushNamed(context, '/contact');
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 40),
                            _AnimatedReveal(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/me.jpg',
                                  height: 280,
                                  width: 280,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
            const SizedBox(height: 40),
            const SectionContainer(
              title: 'About Me',
              description:
                  'I\'m a passionate Flutter developer with a background in design and backend. I specialize in building beautiful and performant apps.',
              buttonLabel: 'Learn More',
              routeName: '/about',
            ),
            const SectionContainer(
              title: 'Skills',
              description:
                  'Flutter, Dart, Firebase, Node.js, REST APIs, MySQL, Git, UI/UX Design, Responsive Web.',
              buttonLabel: 'View All Skills',
              routeName: '/skills',
            ),
            const SectionContainer(
              title: 'Projects',
              description:
                  'Take a look at some of the amazing projects I\'ve built with Flutter and web technologies.',
              buttonLabel: 'See Projects',
              routeName: '/projects',
            ),
            const SectionContainer(
              title: 'Get in Touch',
              description:
                  'Interested in working together or have any questions? Let\'s connect and chat!',
              buttonLabel: 'Contact Me',
              routeName: '/contact',
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

Widget _heroButton(String label, VoidCallback onPressed) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ).copyWith(
        overlayColor: MaterialStateProperty.all(Colors.amber.shade100),
      ),
      onPressed: onPressed,
      child: Text(label),
    ),
  );
}

class _AnimatedReveal extends StatelessWidget {
  final Widget child;
  const _AnimatedReveal({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
