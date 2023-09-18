import 'package:flutter/material.dart';
import 'package:valorant_api/UI_Helper/UI_Helper.dart';
import 'package:valorant_api/model/weapons_model.dart';

class SkinDetailPageAppTitle extends StatelessWidget {
  final Skin skin;
  const SkinDetailPageAppTitle({Key? key, required this.skin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(color: Colors.black12, blurRadius: 15, spreadRadius: 0)
        ],
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: UIHelper.valorantColor, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      ),
      child: FittedBox(
        child: Text(
          skin.displayName,
          style: const TextStyle(
              shadows: [Shadow(color: Colors.white38, blurRadius: 15)],
              fontFamily: 'ValorantFont',
              color: Colors.red,
              fontSize: 25),
        ),
      ),
    );
  }
}
