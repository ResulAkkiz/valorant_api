part of 'weapon_bloc.dart';

@immutable
abstract class WeaponState {}

class WeaponSuccessful extends WeaponState {
  final List<Weapon> weaponList;
  WeaponSuccessful(this.weaponList);
}

class WeaponError extends WeaponState {
  final String message;
  WeaponError(this.message);
}

class WeaponLoading extends WeaponState {}

class WeaponInitial extends WeaponState {}
