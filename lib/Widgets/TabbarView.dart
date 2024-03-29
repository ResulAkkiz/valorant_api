import 'package:flutter/material.dart';
import 'package:valorant_api/Widgets/tabview_item.dart';
import 'package:valorant_api/model/weapons_model.dart';

class TabbarView extends StatelessWidget {
  final TabController tabController;
  final Weapon weapon;
  const TabbarView(
      {Key? key, required this.tabController, required this.weapon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      children: getTabViewItems(weapon),
    );
  }
}
