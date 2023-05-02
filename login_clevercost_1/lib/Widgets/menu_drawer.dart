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
              child: Text(
                'Menu', 
                style: TextStyle( 
                  fontWeight: FontWeight.bold,
                  fontSize: 24)
              ),
            ),
          ),
          sectionLabel('Sections'),
          const ListTileDrawer(
              title: 'Dashboard', route: '/dummypage', icon: Icon(Icons.radio)),
          const ListTileDrawer(
              title: 'Products', route: '/dummypagedos', icon: Icon(Icons.abc)),
          const ListTileDrawer(
              title: 'Invoices',
              route: '/dummypagedos',
              icon: Icon(Icons.dangerous)),
          const ListTileDrawer(
              title: 'Vendors', route: '/dummypage', icon: Icon(Icons.face_2)),
          const ListTileDrawer(
              title: 'Sale Items',
              route: '/dummypage',
              icon: Icon(Icons.radar)),
          sectionLabel('Tools'),
          const ListTileDrawer(
              title: 'Upload Document',
              route: '/dummypage',
              icon: Icon(Icons.table_bar)),
          const ListTileDrawer(
              title: 'VAT calculator',
              route: '/vat_calc',
              icon: Icon(Icons.calculate_outlined)),
          sectionLabel('Account'),
          const ListTileDrawer(
              title: 'Account settings', route: '/dummypage', icon: Icon(Icons.table_bar)),
          const ListTileDrawer(
              title: 'Switch company', route: '/dummypage', icon: Icon(Icons.table_bar)),
        ],
      ),
    );
  }
}
