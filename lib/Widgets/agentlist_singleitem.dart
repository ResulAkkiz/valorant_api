import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/agents_model.dart';

import 'package:valorant_api/UI_Helper/ui_helper.dart';

class AgentListItems extends StatelessWidget {
  final Agent agent;
  const AgentListItems({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: UIHelper.getBackColorList(agent),
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          right: -20,
          left: 40,
          bottom: 20,
          child: CachedNetworkImage(
            imageUrl: agent.fullPortraitV2.toString(),
            placeholder: (context, url) => Center(
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                // ignore: sort_child_properties_last
                child: const CircularProgressIndicator(
                  color: Colors.purple,
                ),
                height: 150.0,
                width: 50.0,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 15,
          right: 150,
          left: 0,
          bottom: 0,
          child: RotatedBox(
            quarterTurns: 1,
            child: Column(
              children: [
                Text(
                  agent.role!.displayName.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  agent.displayName.toString(),
                  style: const TextStyle(
                      fontFamily: 'ValorantFont',
                      color: Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
