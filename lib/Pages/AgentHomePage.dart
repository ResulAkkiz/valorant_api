import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Agents.dart';
import 'package:valorant_api/Pages/AgentDetailPage.dart';
import 'package:valorant_api/Services/Agents_API.dart';
import 'package:valorant_api/Widgets/AgentListItems.dart';

class AgentHomePage extends StatefulWidget {
  AgentHomePage({Key? key}) : super(key: key);

  @override
  State<AgentHomePage> createState() => _AgentHomePageState();
}

class _AgentHomePageState extends State<AgentHomePage> {
  late Future<List<Agents>> FutureAgentList;
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
            List<Agents> agentList = snapshot.data;
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
