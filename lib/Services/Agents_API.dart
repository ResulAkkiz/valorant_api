import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/Models/agents_model.dart';

class AgentsApi {
  static const String _url = 'https://valorant-api.com/v1/agents';
  static Future<List<Agent>> getAgentList() async {
    List<Agent> AgentList = [];
    Response result = await Dio().get(_url);
    var encodeString = jsonEncode(result.data['data']);
    debugPrint(encodeString);
    var decodingList = jsonDecode(encodeString);
    if (decodingList is List) {
      AgentList = decodingList.map((e) => Agent.fromJson(e)).toList();
    }
    return AgentList;
  }
}
