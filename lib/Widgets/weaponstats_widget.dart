import 'package:flutter/material.dart';
import 'package:valorant_api/Models/weapons_model.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/Widgets/weapon_rangelist.dart';
import 'package:valorant_api/Widgets/weaponstats_item.dart';
import 'package:valorant_api/Widgets/weaponstatsimage_item.dart';

class WeaponStatsWidget extends StatelessWidget {
  final Weapon weapon;
  const WeaponStatsWidget({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIHelper.valorantColor,
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
                    weaponStatsValue: UIHelper.getCategory(weapon.category),
                  ),
                  WeaponStatsItem(
                    weaponStatsTitle: 'WALL DAMAGE',
                    weaponStatsValue: UIHelper.getCategory(
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
