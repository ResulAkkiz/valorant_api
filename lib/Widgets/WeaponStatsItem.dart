import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';

class WeaponStatsItem extends StatelessWidget {
  String weaponStatsTitle;
  String weaponStatsValue;
  WeaponStatsItem(
      {Key? key,
      required this.weaponStatsTitle,
      required this.weaponStatsValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            weaponStatsTitle,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'ValorantFont', fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            weaponStatsValue,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
