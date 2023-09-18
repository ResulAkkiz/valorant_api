import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_api/Pages/agent_detail_page.dart';
import 'package:valorant_api/Widgets/agentlist_singleitem.dart';
import 'package:valorant_api/bloc/agent_bloc/bloc/agent_bloc.dart';

import '../model/agents_model.dart';

class AgentHomePage extends StatefulWidget {
  const AgentHomePage({Key? key}) : super(key: key);

  @override
  State<AgentHomePage> createState() => _AgentHomePageState();
}

class _AgentHomePageState extends State<AgentHomePage> {
  @override
  void initState() {
    context.read<AgentBloc>().add(FetchAgent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          if (state is AgentSuccessful) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.agentList.length,
              itemBuilder: (BuildContext context, int index) {
                Agent currentAgent = state.agentList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AgentDetailPage(agent: currentAgent),
                      ),
                    );
                  },
                  child: AgentListItems(
                    agent: currentAgent,
                  ),
                );
              },
            );
          } else if (state is AgentError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
