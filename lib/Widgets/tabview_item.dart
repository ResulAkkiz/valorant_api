import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/Widgets/skinlist.dart';
import 'package:valorant_api/Widgets/weaponstats_widget.dart';
import 'package:valorant_api/model/weapons_model.dart';

List<Widget> getTabViewItems(Weapon weapon) {
  if (weapon.displayName != 'Melee') {
    return [
      WeaponStatsWidget(
        weapon: weapon,
      ),
      SkinListWidget(weapon),
    ];
  } else {
    return [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UIHelper.valorantColor,
          ),
          child: Center(
              child: SkinList(
            weapon: weapon,
          )),
        ),
      ),
    ];
  }
}

class SkinListWidget extends StatelessWidget {
  const SkinListWidget(this.weapon, {super.key});
  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIHelper.valorantColor,
        ),
        child: Center(
            child: SkinList(
          weapon: weapon,
        )),
      ),
    );
  }
}
