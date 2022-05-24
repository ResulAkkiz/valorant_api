import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';

class WeaponListItem extends StatelessWidget {
  Weapon weapon;
  late List<String> category = weapon.category.split('::');
  WeaponListItem({Key? key, required this.weapon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: [
            UIHelper.BackColor,
            UIHelper.ValorantColor,
            UIHelper.BackColor
          ])),
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: weapon.uuid,
            child: SizedBox(
              width: 350,
              height: 175,
              child: (CachedNetworkImage(imageUrl: weapon.displayIcon)),
            ),
          ),
          Text(
            weapon.displayName,
            style: const TextStyle(
                fontFamily: 'ValorantFont', color: Colors.white, fontSize: 35),
          ),
          Row(
            children: [Expanded(child: Chip(label: Text('${category[1]}')))],
          )
        ],
      ),
    );
  }
}
