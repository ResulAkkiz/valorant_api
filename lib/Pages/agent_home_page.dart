import 'package:flutter/material.dart';
import 'package:valorant_api/Pages/AgentDetailPage.dart';
import 'package:valorant_api/Widgets/agentlist_singleitem.dart';

import '../Models/agents_model.dart';
import '../Services/agents_api.dart';

class AgentHomePage extends StatefulWidget {
  const AgentHomePage({Key? key}) : super(key: key);

  @override
  State<AgentHomePage> createState() => _AgentHomePageState();
}

class _AgentHomePageState extends State<AgentHomePage> {
  late Future<List<Agent>> FutureAgentList;
  @override
  void initState() {
    FutureAgentList = AgentsApi.getAgentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FutureAgentList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Agent> agentList = snapshot.data;
            agentList.removeWhere((agent) => agent.isPlayableCharacter == null);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: agentList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AgentDetailPage(agent: agentList[index]),
                      ),
                    );
                  },
                  child: AgentListItems(
                    agent: agentList[index],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
