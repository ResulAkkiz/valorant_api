import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';
import 'package:valorant_api/Pages/WeaponDetailPage.dart';
import 'package:valorant_api/Services/Weapon_API.dart';
import 'package:valorant_api/Widgets/WeaponListItem.dart';

class WeaponHomePage extends StatefulWidget {
  WeaponHomePage({Key? key}) : super(key: key);

  @override
  State<WeaponHomePage> createState() => _WeaponHomePageState();
}

class _WeaponHomePageState extends State<WeaponHomePage> {
  late Future<List<Weapon>> FutureWeaponList;

  @override
  void initState() {
    FutureWeaponList = WeaponApi.getWeaponList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FutureWeaponList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Weapon> weaponList = snapshot.data;
            return ListView.builder(
              itemCount: weaponList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(weapon: weaponList[index]),
                      ),
                    );
                  },
                  child: WeaponListItem(
                    weapon: weaponList[index],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
