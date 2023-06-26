import 'package:flutter/material.dart';

import 'package:valorant_api/Models/weapons_model.dart';

class SkinDetailPageAppTitle extends StatelessWidget {
  final Skin skin;
  const SkinDetailPageAppTitle({Key? key, required this.skin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                child: Text(
                  skin.displayName,
                  maxLines: 1,
                  style: const TextStyle(
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 129, 104, 103),
                            blurRadius: 15)
                      ],
                      fontFamily: 'ValorantFont',
                      color: Colors.red,
                      fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
