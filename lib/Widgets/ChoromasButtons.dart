import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';

class ChromasButtons extends StatelessWidget {
  late List<Chroma> Chromas;
  ChromasButtons({Key? key, required this.Chromas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Chromas.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
              onPressed: () {},
              icon: Chromas[index].swatch != null
                  ? Image.network(Chromas[index].swatch.toString())
                  : const SizedBox()),
        );
      },
    );
  }
}
