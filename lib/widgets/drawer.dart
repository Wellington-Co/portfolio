import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/about');
            },
          ),
          ListTile(
            title: const Text('Skills'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/skills');
            },
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/projects');
            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}
