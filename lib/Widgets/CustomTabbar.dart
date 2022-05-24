import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';
import 'package:valorant_api/Widgets/TabItems.dart';

class CustomTabbar extends StatelessWidget {
  TabController tabController;
  Weapon weapon;
  CustomTabbar({Key? key, required this.tabController, required this.weapon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 100, 26, 26).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: UIHelper.ValorantColor),
            borderRadius: BorderRadius.circular(10.0)),
        child: TabBar(
          indicator: BoxDecoration(
            color: UIHelper.ValorantColor,
            borderRadius: BorderRadius.circular(10),
          ),
          controller: tabController,
          labelColor: UIHelper.BackColor,
          unselectedLabelColor: UIHelper.ValorantColor,
          tabs: GetTabList(weapon.displayName),
        ),
      ),
    );
  }
}
