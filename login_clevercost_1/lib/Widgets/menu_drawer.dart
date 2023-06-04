import 'package:flutter/material.dart';
import 'package:login_clevercost_1/Widgets/listtile_drawer.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  ListTile sectionLabel(String text) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
          ),
          sectionLabel('Sections'),
          const ListTileDrawer(
              title: 'Dashboard',
              route: '/dummyPage1',
              icon: Icon(Icons.radio)),
          const ListTileDrawer(
              title: 'Products', route: '/dummyPage1', icon: Icon(Icons.abc)),
          const ListTileDrawer(
              title: 'Invoices',
              route: '/dummyPage1',
              icon: Icon(Icons.dangerous)),
          const ListTileDrawer(
              title: 'Vendors', route: '/dummyPage1', icon: Icon(Icons.face_2)),
          const ListTileDrawer(
              title: 'Sale Items',
              route: '/dummyPage1',
              icon: Icon(Icons.radar)),
          sectionLabel('Tools'),
          const ListTileDrawer(
              title: 'Upload Document',
              route: '/dummyPage2',
              icon: Icon(Icons.table_bar)),
          const ListTileDrawer(
              title: 'VAT calculator',
              route: '/vatCalc',
              icon: Icon(Icons.calculate_outlined)),
          sectionLabel('Account'),
          const ListTileDrawer(
              title: 'Account settings',
              route: '/dashboard',
              icon: Icon(Icons.table_bar)),
          const ListTileDrawer(
              title: 'Switch company',
              route: '/companyPage',
              icon: Icon(Icons.table_bar)),
        ],
      ),
    );
  }
}
