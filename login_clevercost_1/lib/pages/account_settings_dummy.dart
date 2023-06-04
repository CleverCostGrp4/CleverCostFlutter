import 'package:flutter/material.dart';
import 'package:login_clevercost_1/Widgets/account_settings_drawer.dart';

class NavigationPageDos extends StatelessWidget {
  const NavigationPageDos({super.key});

 static const String routeName = '/dummypagedos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Dummy'),),
        drawer: const AccountSettingDrawer(),
        body: const Column(
          children: [
            Text('Navigation Page Dos'),
          ],
        ));
  }
}
