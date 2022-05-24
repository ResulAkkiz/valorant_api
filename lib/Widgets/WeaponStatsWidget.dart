import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';
import 'package:valorant_api/Widgets/RangeList.dart';
import 'package:valorant_api/Widgets/WeaponStatsImageItem.dart';
import 'package:valorant_api/Widgets/WeaponStatsItem.dart';

class WeaponStatsWidget extends StatelessWidget {
  Weapon weapon;
  WeaponStatsWidget({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIHelper.ValorantColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WeaponStatsImageItem(
                    weaponStatsTitle: 'KILLFEED ICON',
                    weaponStatsImage: weapon.killStreamIcon,
                  ),
                  WeaponStatsItem(
                    weaponStatsTitle: 'CATEGORY',
                    weaponStatsValue: UIHelper.GetCategory(weapon.category),
                  ),
                  WeaponStatsItem(
                    weaponStatsTitle: 'WALL DAMAGE',
                    weaponStatsValue: UIHelper.GetCategory(
                        weapon.weaponStats!.wallPenetration),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WeaponStatsItem(
                    weaponStatsTitle: 'FIRE RATE',
                    weaponStatsValue: weapon.weaponStats!.fireRate.toString(),
                  ),
                  WeaponStatsItem(
                      weaponStatsTitle: 'RELOAD SPEED',
                      weaponStatsValue:
                          weapon.weaponStats!.reloadTimeSeconds.toString()),
                  WeaponStatsItem(
                      weaponStatsTitle: 'MAGAZIN SIZE',
                      weaponStatsValue:
                          weapon.weaponStats!.magazineSize.toString()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  RangeList(
                    weapon: weapon,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
