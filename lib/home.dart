import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Startseite extends StatelessWidget {
  String text;
  int groesse;
  List<Widget> children;
  void Function()? onTab;

  Startseite(
      {required this.text,
      this.groesse = 1,
      this.onTab,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: groesse,
        child: GestureDetector(
          onTap: onTab ?? () => {},
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: const EdgeInsets.all(10.0),
            child: Row(children: [
              Container(margin: const EdgeInsets.all(10.0), child: Text(text)),
              ...children
            ]),
          ),
        ));
  }
}

class StartseiteMitLink extends StatelessWidget {
  String text, url;
  int groesse;

  StartseiteMitLink({required this.text, this.groesse = 1, required this.url});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: groesse,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: const EdgeInsets.all(10.0),
        child: Row(children: [
          Container(margin: const EdgeInsets.all(10.0), child: Text(text)),
          ElevatedButton(onPressed: _launchURL, child: const Text(""))
        ]),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(this.url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
