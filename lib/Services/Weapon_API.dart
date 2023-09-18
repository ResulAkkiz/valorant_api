import 'package:dio/dio.dart';
import 'package:valorant_api/model/weapons_model.dart';

class WeaponApi {
  static const String _url = 'https://valorant-api.com/v1/weapons';
  static Future<List<Weapon>> getWeaponList() async {
    List<Weapon> weaponList = [];
    Response result = await Dio().get(_url);
    var data = result.data['data'];
    if (data is List) {
      weaponList = data.map((e) => Weapon.fromJson(e)).toList();
    }
    return weaponList;
  }
}
