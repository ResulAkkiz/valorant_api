import 'package:flutter/material.dart';
import 'package:valorant_api/Models/weapons.dart';

class ChromasButtons extends StatelessWidget {
  final List<Chroma> chromas;
  const ChromasButtons({Key? key, required this.chromas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: chromas.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
              onPressed: () {},
              icon: chromas[index].swatch != null
                  ? Image.network(chromas[index].swatch.toString())
                  : const SizedBox()),
        );
      },
    );
  }
}
