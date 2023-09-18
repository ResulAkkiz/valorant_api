part of 'agent_bloc.dart';

abstract class AgentState {}

class AgentSuccessful extends AgentState {
  List<Agent> agentList;
  AgentSuccessful(this.agentList);
}

class AgentError extends AgentState {
  String message;
  AgentError(this.message);
}

class AgentLoading extends AgentState {}

class AgentInitial extends AgentState {}
