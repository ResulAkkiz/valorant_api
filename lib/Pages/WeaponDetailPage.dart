import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/Widgets/CustomTabbar.dart';
import 'package:valorant_api/Widgets/DetailPageAppTitle.dart';
import 'package:valorant_api/Widgets/TabItems.dart';
import 'package:valorant_api/Widgets/TabbarView.dart';

class DetailPage extends StatefulWidget {
  Weapon weapon;
  DetailPage({Key? key, required this.weapon}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
        length: widget.weapon.displayName == 'Melee' ? 1 : 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DetailPageAppTitle(
              weapon: widget.weapon,
            ),
            Hero(
              tag: widget.weapon.uuid,
              child: SizedBox(
                height: 150,
                child: CachedNetworkImage(imageUrl: widget.weapon.displayIcon),
              ),
            ),
            CustomTabbar(
              weapon: widget.weapon,
              tabController: tabController,
            ),
            Expanded(
              child: TabbarView(
                weapon: widget.weapon,
                tabController: tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
