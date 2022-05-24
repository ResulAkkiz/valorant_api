import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Weapons.dart';

import 'package:valorant_api/Widgets/SkinDetailPageAppTitle.dart';

class SkinDetailPage extends StatefulWidget {
  Skin skin;
  SkinDetailPage({Key? key, required this.skin}) : super(key: key);

  @override
  State<SkinDetailPage> createState() => _SkinDetailPageState();
}

class _SkinDetailPageState extends State<SkinDetailPage> {
  late String displayIcon = widget.skin.chromas!.first.fullRender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkinDetailPageAppTitle(
              skin: widget.skin,
            ),
            SizedBox(
              height: 150,
              child: CachedNetworkImage(imageUrl: displayIcon),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.skin.chromas!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return IconButton(
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          displayIcon =
                              widget.skin.chromas![index].fullRender.toString();
                        });
                      },
                      icon: widget.skin.chromas![index].swatch != null
                          ? Image.network(
                              widget.skin.chromas![index].swatch.toString())
                          : const SizedBox());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
