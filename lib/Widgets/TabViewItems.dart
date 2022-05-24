import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';
import 'package:valorant_api/Widgets/WeaponStatsWidget.dart';

import 'SkinList.dart';

List<Widget> TabViewItems(Weapon weapon) {
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
            color: UIHelper.ValorantColor,
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
            color: UIHelper.ValorantColor,
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
