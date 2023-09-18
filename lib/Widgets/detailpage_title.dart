import 'package:flutter/material.dart';
import 'package:valorant_api/model/weapons_model.dart';

class DetailPageAppTitle extends StatelessWidget {
  final Weapon weapon;
  const DetailPageAppTitle({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              weapon.displayName,
              style: const TextStyle(
                  shadows: [Shadow(color: Colors.red, blurRadius: 15)],
                  fontFamily: 'ValorantFont',
                  fontSize: 50),
            ),
            SizedBox(
                child: Image.asset(
              'assets/images/valorant.png',
              fit: BoxFit.contain,
            ))
          ],
        ),
      ),
    );
  }
}
