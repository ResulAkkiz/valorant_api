import 'package:flutter/material.dart';
import 'package:valorant_api/Pages/agent_home_page.dart';
import 'package:valorant_api/Pages/weapon_home_page.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';
import 'package:valorant_api/core/extension/image_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Widget> _widgetOptions = <Widget>[
    const AgentHomePage(),
    const WeaponHomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
      ),
      body: ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, int value, child) {
            return _widgetOptions[value];
          }),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.selectedIndex});
  final ValueNotifier<int> selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
              backgroundColor: UIHelper.valorantColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SizedBox.square(
                      dimension: 30, child: ImageAssets.agent.toImage),
                  label: 'Agents',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.square(
                      dimension: 30,
                      child: ImageAssets.weapon.toImageWithColor(Colors.white)),
                  label: 'Weapons',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex.value,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              onTap: (value) {
                selectedIndex.value = value;
              });
        },
      ),
    );
  }
}
