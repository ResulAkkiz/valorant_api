import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/weapons_model.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/Widgets/skinlist.dart';
import 'package:valorant_api/Widgets/weaponstats_widget.dart';

List<Widget> getTabViewItems(Weapon weapon) {
  if (weapon.displayName != 'Melee') {
    return [
      WeaponStatsWidget(
        weapon: weapon,
      ),
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
