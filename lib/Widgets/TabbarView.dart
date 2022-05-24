import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/Widgets/TabViewItems.dart';

class TabbarView extends StatelessWidget {
  TabController tabController;
  Weapon weapon;
  TabbarView({Key? key, required this.tabController, required this.weapon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      children: TabViewItems(weapon),
    );
  }
}
