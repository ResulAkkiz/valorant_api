import 'package:flutter/material.dart';
import 'package:valorant_api/Models/weapons_model.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';

class CustomTabbar extends StatelessWidget {
  final TabController tabController;
  final Weapon weapon;
  const CustomTabbar(
      {Key? key, required this.tabController, required this.weapon})
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
            border: Border.all(color: UIHelper.valorantColor),
            borderRadius: BorderRadius.circular(10.0)),
        child: TabBar(
            indicator: BoxDecoration(
              color: UIHelper.valorantColor,
              borderRadius: BorderRadius.circular(10),
            ),
            controller: tabController,
            labelColor: UIHelper.backColor,
            unselectedLabelColor: UIHelper.valorantColor,
            tabs: weapon.displayName == 'Melee'
                ? const [Tab(text: 'Skins')]
                : const [Tab(text: 'Weapon Stats'), Tab(text: 'Skins')]),
      ),
    );
  }
}
