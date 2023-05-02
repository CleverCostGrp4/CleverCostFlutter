import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer(
      {super.key,
      required this.title,
      this.icon,
      required this.route,
      this.navigateToThirdParty = false});

  final Icon? icon;
  final String title;
  final String route;
  final bool navigateToThirdParty;

Widget _styledIcon(Icon? icon) {
    if (icon == null) return const SizedBox();

    return IconTheme(
      data: const IconThemeData(//Mangler korrekt farve
        size: 24, //Mangler korrekt størrelse
      ),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: _styledIcon(icon),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: navigateToThirdParty ? const Icon(Icons.open_in_new) : null,
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
