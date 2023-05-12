import 'package:flutter/material.dart';
import 'package:login_clevercost_1/Widgets/listtile_drawer.dart';

class AccountSettingDrawer extends StatelessWidget {
  const AccountSettingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Account Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
          ),
          ListTileDrawer(title: 'Account Overview', route: '/dummypage'),
          ListTileDrawer(title: 'Companies', route: '/dummypagedos'),
          ListTileDrawer(
            title: 'Subscriptions',
            route: '/dummypagedos',
          ),
          ListTileDrawer(
            title: 'Privacy Policy',
            route: 'https://clevercost.com/privacy-policy/',
            navigateToThirdParty: true,
          ),
          ListTileDrawer(
            title: 'Terms & Conditions',
            route: 'https://clevercost.com/terms-condition/',
            navigateToThirdParty: true,
          ),
          ListTileDrawer(
            title: 'Contact',
            route: 'https://clevercost.com/contact/',
            navigateToThirdParty: true,
          ),
        ],
      ),
    );
  }
}
