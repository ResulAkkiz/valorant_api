import 'package:dio/dio.dart';
import 'package:valorant_api/Models/agents_model.dart';

class AgentsApi {
  static const String _url = 'https://valorant-api.com/v1/agents';
  static Future<List<Agent>> getAgentList() async {
    List<Agent> agentList = [];
    Response result = await Dio().get(_url);
    var data = result.data['data'];
    if (data is List) {
      agentList = data.map((e) => Agent.fromJson(e)).toList();
    }
    return agentList;
  }
}
