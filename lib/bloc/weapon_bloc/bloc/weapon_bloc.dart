import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:valorant_api/model/weapons_model.dart';
import 'package:valorant_api/services/base_service.dart';

part 'weapon_event.dart';
part 'weapon_state.dart';

class WeaponBloc extends Bloc<WeaponEvent, WeaponState> {
  List<Weapon> weaponListCache = [];
  WeaponBloc() : super(WeaponInitial()) {
    on<FetchWeapon>((event, emit) async {
      emit(WeaponLoading());
      List<Weapon> weaponList = [];
      try {
        if (weaponListCache.isNotEmpty) {
          weaponList = List.from(weaponListCache);
          debugPrint("from cache");
        } else {
          weaponList = List.from(await BaseService.fetchData(DataType.weapons));
          weaponListCache.addAll(weaponList);
          debugPrint("from service");
        }
        emit(WeaponSuccessful(weaponList));
      } catch (e) {
        emit(WeaponError(e.toString()));
      }
    });
  }
}
