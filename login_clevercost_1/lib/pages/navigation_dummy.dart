import 'package:flutter/material.dart';
import 'package:login_clevercost_1/Widgets/menu_drawer.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

 static const String routeName = '/dummypage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Dummy'),),
        drawer: const MenuDrawer(),
        body: Column(
          children: const [
            Text('Navigation Page'),
          ],
        ));
  }
}
