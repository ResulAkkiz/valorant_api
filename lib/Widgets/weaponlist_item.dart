import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/model/weapons_model.dart';

class WeaponListItem extends StatefulWidget {
  final Weapon weapon;

  const WeaponListItem({Key? key, required this.weapon}) : super(key: key);

  @override
  State<WeaponListItem> createState() => _WeaponListItemState();
}

class _WeaponListItemState extends State<WeaponListItem> {
  late List<String> category;

  @override
  void initState() {
    category = widget.weapon.category.split('::');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                UIHelper.backColor,
                UIHelper.valorantColor,
                UIHelper.backColor
              ])),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: widget.weapon.uuid,
            child: AspectRatio(
                aspectRatio: 2.5,
                child: (CachedNetworkImage(
                  imageUrl: widget.weapon.displayIcon,
                ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: FittedBox(
              child: Text(
                widget.weapon.displayName,
                style: const TextStyle(
                  fontFamily: 'ValorantFont',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [Expanded(child: Chip(label: Text(category[1])))],
          )
        ],
      ),
    );
  }
}
