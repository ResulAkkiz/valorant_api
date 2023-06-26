import 'package:flutter/material.dart';
import 'package:valorant_api/Models/weapons_model.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';

class RangeList extends StatefulWidget {
  const RangeList({Key? key, required this.weapon}) : super(key: key);
  final Weapon weapon;

  @override
  State<RangeList> createState() => _RangeListState();
}

class _RangeListState extends State<RangeList> {
  var mycontroller = PageController(initialPage: 0);
  late List<DamageRanges>? damageRanges;
  @override
  void initState() {
    damageRanges = widget.weapon.weaponStats?.damageRanges;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: damageRanges!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 26, 7, 7).withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(color: UIHelper.valorantColor),
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${damageRanges![index].rangeStartMeters}-${damageRanges![index].rangeEndMeters}',
                        style: const TextStyle(
                            fontFamily: 'ValorantFont', color: Colors.white),
                      ),
                      const Text(
                        'METER',
                        style: TextStyle(
                            fontFamily: 'ValorantFont', color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/Person.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Head Damage---${damageRanges![index].headDamage}',
                              style: const TextStyle(
                                  fontFamily: 'ValorantFont',
                                  color: Colors.white),
                            ),
                            Text(
                              'Body Damage---${damageRanges![index].bodyDamage}',
                              style: const TextStyle(
                                  fontFamily: 'ValorantFont',
                                  color: Colors.white),
                            ),
                            Text(
                              'Leg Damage---${damageRanges![index].legDamage}',
                              style: const TextStyle(
                                  fontFamily: 'ValorantFont',
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
        controller: mycontroller,
        pageSnapping: true,
        onPageChanged: (index) {
          debugPrint('Sayfa no: $index');
        },
      ),
    );
  }
}
