import 'package:flutter/material.dart';
import 'package:valorant_api/Pages/agent_home_page.dart';
import 'package:valorant_api/Pages/weapon_home_page.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const AgentHomePage(),
    const WeaponHomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: UIHelper.valorantColor,
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
