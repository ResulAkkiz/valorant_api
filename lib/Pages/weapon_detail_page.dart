import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Widgets/customtabbar.dart';
import 'package:valorant_api/Widgets/detailpage_title.dart';
import 'package:valorant_api/Widgets/tabbarview.dart';

import '../model/weapons_model.dart';

class WeaponDetailPage extends StatefulWidget {
  final Weapon weapon;
  const WeaponDetailPage({Key? key, required this.weapon}) : super(key: key);

  @override
  State<WeaponDetailPage> createState() => _WeaponDetailPageState();
}

class _WeaponDetailPageState extends State<WeaponDetailPage>
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DetailPageAppTitle(
                weapon: widget.weapon,
              ),
              Hero(
                tag: widget.weapon.uuid,
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child:
                      CachedNetworkImage(imageUrl: widget.weapon.displayIcon),
                ),
              ),
              CustomTabbar(
                weapon: widget.weapon,
                tabController: tabController,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: TabbarView(
                  weapon: widget.weapon,
                  tabController: tabController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
