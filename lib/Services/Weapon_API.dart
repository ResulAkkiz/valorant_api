import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:valorant_api/Models/Weapons.dart';

class WeaponApi {
  static const String _url = 'https://valorant-api.com/v1/weapons';
  static Future<List<Weapon>> getWeaponList() async {
    List<Weapon> WeaponList = [];
    Response result = await Dio().get(_url);
    var EncodeString = jsonEncode(result.data['data']);
    var DecodingList = jsonDecode(EncodeString);
    if (DecodingList is List) {
      WeaponList = DecodingList.map((e) => Weapon.fromJson(e)).toList();
    }
    return WeaponList;
  }
}
