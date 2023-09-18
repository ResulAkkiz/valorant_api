import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/model/agents_model.dart';
import 'package:valorant_api/services/base_service.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  List<Agent> agentListCache = [];
  AgentBloc() : super(AgentInitial()) {
    on<FetchAgent>((event, emit) async {
      emit(AgentLoading());
      List<Agent> agentList = [];
      try {
        if (agentListCache.isNotEmpty) {
          agentList = List.from(agentListCache);
          debugPrint("from cache");
        } else {
          agentList = List.from(await BaseService.fetchData(DataType.agents));
          agentListCache.addAll(agentList);
          debugPrint("from service");
        }
        agentList.removeWhere((agent) => agent.isPlayableCharacter == null);
        emit(AgentSuccessful(agentList));
      } catch (e) {
        emit(AgentError(e.toString()));
      }
    });
  }
}
