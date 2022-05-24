import 'package:flutter/material.dart';

List<Widget> GetTabList(String Name) {
  List<Widget> Items;
  if (Name != 'Melee') {
    Items = const [
      Tab(
        text: 'Weapon Stats',
      ),
      Tab(
        text: 'Skins',
      )
    ];
  } else {
    Items = const [
      Tab(
        text: 'Skins',
      )
    ];
  }

  return Items;
}
