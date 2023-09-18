import 'package:dio/dio.dart';
import 'package:valorant_api/model/agents_model.dart';
import 'package:valorant_api/model/weapons_model.dart';

enum DataType { agents, weapons }

class BaseService {
  static const String _baseUrl = "https://valorant-api.com/v1/";

  static Future<List<dynamic>> fetchData(DataType dataType) async {
    List<dynamic> dataList = [];
    Response result = await Dio().get("$_baseUrl${dataType.name}");
    var data = result.data['data'];
    if (data is List) {
      dataList = data.map((e) => _fromJson(e, dataType)).toList();
    }
    return dataList;
  }

  static dynamic _fromJson(Map<String, dynamic> json, DataType dataType) {
    if (dataType == DataType.weapons) {
      return Weapon.fromJson(json);
    } else if (dataType == DataType.agents) {
      return Agent.fromJson(json);
    }
  }
}
