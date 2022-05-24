import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:valorant_api/Models/Agents.dart';

class AgentsApi {
  static const String _url = 'https://valorant-api.com/v1/agents';
  static Future<List<Agents>> getAgentList() async {
    List<Agents> AgentList = [];
    Response result = await Dio().get(_url);
    var EncodeString = jsonEncode(result.data['data']);
    var DecodingList = jsonDecode(EncodeString);
    if (DecodingList is List) {
      AgentList = DecodingList.map((e) => Agents.fromJson(e)).toList();
    }
    return AgentList;
  }
}
