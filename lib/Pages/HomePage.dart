import 'package:flutter/material.dart';
import 'package:valorant_api/Pages/AgentHomePage.dart';
import 'package:valorant_api/Pages/WeaponHomePage.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    AgentHomePage(),
    WeaponHomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: UIHelper.ValorantColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  'assets/images/AgentIcon.png',
                ),
              ),
              label: 'Agents',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  'assets/images/WeaponIcon.png',
                  color: Colors.white,
                ),
              ),
              label: 'Weapons',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          }),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
