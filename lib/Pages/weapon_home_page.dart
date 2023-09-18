import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_api/Pages/weapon_detail_page.dart';
import 'package:valorant_api/Widgets/weaponlist_item.dart';
import 'package:valorant_api/bloc/weapon_bloc/bloc/weapon_bloc.dart';
import 'package:valorant_api/model/weapons_model.dart';

class WeaponHomePage extends StatefulWidget {
  const WeaponHomePage({Key? key}) : super(key: key);

  @override
  State<WeaponHomePage> createState() => _WeaponHomePageState();
}

class _WeaponHomePageState extends State<WeaponHomePage> {
  @override
  void initState() {
    context.read<WeaponBloc>().add(FetchWeapon());
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeaponBloc, WeaponState>(
      builder: (context, state) {
        print(state.toString());
        if (state is WeaponSuccessful) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.weaponList.length,
            itemBuilder: (BuildContext context, int index) {
              Weapon currentWeapon = state.weaponList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WeaponDetailPage(weapon: currentWeapon),
                    ),
                  );
                },
                child: WeaponListItem(
                  weapon: currentWeapon,
                ),
              );
            },
          );
        } else if (state is WeaponError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
