class Agents {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? background;
  bool? isPlayableCharacter;
  Role? role;
  List<Abilities>? abilities;
  List<String>? backgroundGradientColors;

  Agents(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.bustPortrait,
      this.fullPortrait,
      this.fullPortraitV2,
      this.background,
      this.isPlayableCharacter,
      this.role,
      this.abilities,
      this.backgroundGradientColors});

  factory Agents.fromJson(Map<String, dynamic> json) {
    if (json['isPlayableCharacter']) {
      return Agents(
        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        bustPortrait: json['bustPortrait'],
        fullPortrait: json['fullPortrait'],
        fullPortraitV2: json['fullPortraitV2'],
        background: json['background'],
        isPlayableCharacter: json['isPlayableCharacter'],
        role: Role.fromJson(json['role']),
        abilities: List<Abilities>.from(
            json["abilities"].map((x) => Abilities.fromJson(x))),
        backgroundGradientColors: List<String>.from(
          json["backgroundGradientColors"] ??
              ['58394dff', '58394dff', '58394dff', '58394dff'],
        ),
      );
    } else {
      return Agents();
    }
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? displayIcon;

  Role({this.uuid, this.displayName, this.displayIcon});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon']);
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  factory Abilities.fromJson(Map<String, dynamic> json) => Abilities(
        slot: json["slot"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );
}
