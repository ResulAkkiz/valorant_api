import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/Widgets/agentabilities_pageview.dart';

import '../model/agents_model.dart';

class AgentDetailPage extends StatefulWidget {
  final Agent agent;

  const AgentDetailPage({Key? key, required this.agent}) : super(key: key);

  @override
  State<AgentDetailPage> createState() => _AgentDetailPageState();
}

class _AgentDetailPageState extends State<AgentDetailPage> {
  int pageNum = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CachedNetworkImage(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    imageUrl: widget.agent.fullPortrait.toString(),
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                            width: 150,
                            height: 250,
                            child: CircularProgressIndicator(
                              color: UIHelper.getColorByAgent(
                                  widget.agent.displayName.toString()),
                            ))),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Text(
                    widget.agent.displayName.toString(),
                    style: const TextStyle(
                        fontFamily: 'ValorantFont',
                        fontSize: 60,
                        color: Colors.white),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 5,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.agent.role!.displayIcon.toString(),
                          height: 25,
                          width: 25,
                        ),
                        Text(
                          ' ${widget.agent.role!.displayName.toString().toUpperCase()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: UIHelper.getColorByAgent(
                            widget.agent.displayName.toString()),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(4, 8)),
                    BoxShadow(
                      color: UIHelper.backColor,
                      spreadRadius: 0,
                      blurRadius: 0,
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 1.25),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.agent.description.toString(),
                  strutStyle: const StrutStyle(fontSize: 15),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              child: Center(
                child: Text(
                  'ABILITIES',
                  style: TextStyle(
                    fontFamily: 'ValorantFont',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSkillButton(0),
                getSkillButton(1),
                getSkillButton(2),
                getSkillButton(3),
              ],
            ),
            AbilitiesPageView(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  pageNum = page;
                });
              },
              agent: widget.agent,
            )
          ],
        ),
      ),
    );
  }

  Container getSkillButton(int val) {
    return Container(
      decoration: BoxDecoration(
        color: pageNum == val ? Colors.red : null,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            pageNum = val;
            controller.jumpToPage(pageNum);
          });
        },
        icon: CachedNetworkImage(
          imageUrl: widget.agent.abilities![val].displayIcon.toString(),
        ),
      ),
    );
  }
}
