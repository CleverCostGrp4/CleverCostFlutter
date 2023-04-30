import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
