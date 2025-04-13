import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Let’s connect!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.phone, color: Colors.amber),
                onPressed: () => _launchUrl('tel:+254743714202'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github, color: Colors.amber),
                onPressed: () => _launchUrl('https://github.com/Wellington-Co'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.amber),
                onPressed: () => _launchUrl('https://www.linkedin.com/in/wellingtone-omondi-netondev'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.discord, color: Colors.amber),
                onPressed: () => _launchUrl('https://discord.com/users/wellingtone.o'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.amber),
                onPressed: () => _launchUrl('https://wa.me/254743714202'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2025 Wellingtone Omondi Otieno • Crafted with passion and purpose',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
