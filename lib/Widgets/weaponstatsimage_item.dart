import 'package:flutter/material.dart';

class WeaponStatsImageItem extends StatelessWidget {
  final String weaponStatsTitle;
  final String weaponStatsImage;
  const WeaponStatsImageItem(
      {Key? key,
      required this.weaponStatsTitle,
      required this.weaponStatsImage})
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
                color: Colors.white, fontFamily: 'ValorantFont'),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: Image.network(
              weaponStatsImage,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
