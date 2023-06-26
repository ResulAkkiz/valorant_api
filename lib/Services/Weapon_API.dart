import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:valorant_api/Models/weapons_model.dart';

class WeaponApi {
  static const String _url = 'https://valorant-api.com/v1/weapons';
  static Future<List<Weapon>> getWeaponList() async {
    List<Weapon> weaponList = [];
    Response result = await Dio().get(_url);
    var encodeString = jsonEncode(result.data['data']);
    var decodingList = jsonDecode(encodeString);
    if (decodingList is List) {
      weaponList = decodingList.map((e) => Weapon.fromJson(e)).toList();
    }
    return weaponList;
  }
}
