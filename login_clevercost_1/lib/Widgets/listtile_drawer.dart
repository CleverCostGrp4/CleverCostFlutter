import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer(
      {super.key,
      required this.title,
      this.icon,
      required this.route,
      this.navigateToThirdParty = false});

  final IconData? icon;
  final String title;
  final String route;
  final bool navigateToThirdParty;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon != null ? Icon(icon) : null,
        title: Text(title),
        trailing: navigateToThirdParty ? Icon(Icons.open_in_new) : null,
        onTap: navigateToThirdParty
            ? () => _launchURL(route)
            : () => Navigator.pushNamed(context, route));
  }
}

Future<void> _launchURL(String urlString) async {
  Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $urlString';
  }
}
