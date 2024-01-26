import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:hackdays/EMail.dart';
import 'package:hackdays/Fundus.dart';
import 'package:hackdays/Kalender.dart';
import 'package:hackdays/Lehrerzimmer.dart';
import 'package:hackdays/Lehrplan.dart';
import 'package:hackdays/Lichttechnik.dart';
import 'package:hackdays/Neues_von_der_SV.dart';
import 'package:hackdays/Schwarzes_Brett.dart';
import 'package:hackdays/Stundenplan.dart';
import 'package:hackdays/Umfragemodul.dart';
import 'package:hackdays/Vertretungsplan.dart';
import 'package:hackdays/Wahlversprechen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Hittfeld';

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp(
          title: appTitle,
          theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.pink.shade900)),
          home: const MyHomePage(title: appTitle),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _widgetOptions = <Widget>[
    Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StartseiteMitLink(
            text: "Vertretungsplan",
            url: "https://vertretungsplan.gymnasium-hittfeld.de/?name=Alle",
          ),
          StartseiteMitLink(
              text: "E-Mail",
              url:
                  "https://student.gymnasium-hittfeld.de/iserv/auth/login?_target_path=/iserv/auth/auth?_iserv_app_url%3D%252Fiserv%252Fapp%252Flogin%253Ftarget%253D%25252Fiserv%25252F%26client_id%3D8_5ar0n7i805s8kwkk4wo80gowg44c0gkg4sowocsckok8wkcc0c%26nonce%3D3c962553-f7e2-477d-974f-178f691098be%26redirect_uri%3Dhttps%253A%252F%252Fstudent.gymnasium-hittfeld.de%252Fiserv%252Fapp%252Fauthentication%252Fredirect%26response_type%3Dcode%26scope%3Dopenid%2520uuid%2520iserv%253Asession-id%2520iserv%253Aweb-ui%2520iserv%253A2fa%253Aconfiguration%2520iserv%253Aaccess-groups%26state%3DeyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IjEifQ.eyJyZWRpcmVjdF91cmkiOiJodHRwczpcL1wvc3R1ZGVudC5neW1uYXNpdW0taGl0dGZlbGQuZGVcL2lzZXJ2Iiwibm9uY2UiOiIzYzk2MjU1My1mN2UyLTQ3N2QtOTc0Zi0xNzhmNjkxMDk4YmUiLCJhZG1pbiI6ZmFsc2UsImlzcyI6Imh0dHBzOlwvXC9zdHVkZW50Lmd5bW5hc2l1bS1oaXR0ZmVsZC5kZVwvaXNlcnZcLyIsImV4cCI6MTcxMzk0NzE5MiwibmJmIjoxNzA2MTcxMTMyLCJpYXQiOjE3MDYxNzExOTIsInNpZCI6IiJ9.Lr780usb-HNWa0QeCeKf3ib2t8AP0B4pVuNUX8ROMKhyyZYc_mixhpLQ9f39DL8Lw67zazp_sW1piDnek1yC6w"),
          Startseite(
            text: "SV",
            children: const [],
            onTab: () {
              // Update the state of the app
              _onItemTapped(12);
            },
          ),
          Startseite(
            text: "Kalender",
            groesse: 4,
            children: const [
              Expanded(child: MonthView()),
            ],
          )
        ],
      ),
    ),
    EMail(),
    Fundus(),
    const Kalender(),
    Lehrerzimmer(),
    Lehrplan(),
    Lichttechnik(),
    Schwarzes_Brett(),
    Stundenplan(),
    Neues_von_der_SV(),
    Umfragemodul(),
    Vertretungsplan(),
    Wahlversprechen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Startseite'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('EMail'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fundus'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Kalender'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lehrerzimmer'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                _onItemTapped(4);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lehrplan'),
              selected: _selectedIndex == 5,
              onTap: () {
                // Update the state of the app
                _onItemTapped(5);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lichttechnik'),
              selected: _selectedIndex == 6,
              onTap: () {
                // Update the state of the app
                _onItemTapped(6);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Schwarzes Brett'),
              selected: _selectedIndex == 7,
              onTap: () {
                // Update the state of the app
                _onItemTapped(7);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Stundenplan'),
              selected: false,
              onTap: () async {
                final Uri url = Uri.parse(
                    "https://stundenplan.gymnasium-hittfeld.de/5-13/Stundenplan_html.htm");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            ListTile(
              title: const Text('SV'),
              selected: _selectedIndex == 9,
              onTap: () {
                // Update the state of the app
                _onItemTapped(9);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Umfragemodul'),
              selected: _selectedIndex == 10,
              onTap: () {
                // Update the state of the app
                _onItemTapped(10);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Vertetungsplan'),
              selected: false,
              onTap: () async {
                final Uri url = Uri.parse(
                    "https://vertretungsplan.gymnasium-hittfeld.de/?name=Alle");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            ListTile(
                title: const Text('Website'),
                selected: false,
                onTap: () async {
                  final Uri url =
                      Uri.parse("https://www.gymnasium-hittfeld.de/");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
