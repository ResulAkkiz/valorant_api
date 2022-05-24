import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/Pages/SkinDetailPage.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';

class SkinList extends StatelessWidget {
  Weapon weapon;
  SkinList({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weapon.skins!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SkinDetailPage(skin: weapon.skins![index])));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: UIHelper.BackColor,
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 150,
                    padding: EdgeInsets.all(12),
                    child: weapon.skins![index].displayIcon == null
                        ? CachedNetworkImage(
                            imageUrl: weapon
                                .skins![index].chromas!.first.fullRender
                                .toString())
                        : CachedNetworkImage(
                            imageUrl: !weapon.skins![index].displayName
                                    .contains("Standard")
                                ? weapon.skins![index].displayIcon.toString()
                                : weapon.displayIcon),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      weapon.skins![index].displayName,
                      style: const TextStyle(
                          fontFamily: 'ValorantFont',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
