class Weapon {
  String uuid;
  String displayName;
  String category;
  String displayIcon;
  String killStreamIcon;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skin>? skins;
  Weapon({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.displayIcon,
    required this.killStreamIcon,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      uuid: json["uuid"].toString().trim(),
      displayName: json["displayName"],
      category: json["category"],
      displayIcon: json["displayIcon"],
      killStreamIcon: json["killStreamIcon"],
      weaponStats: json["weaponStats"] != null
          ? WeaponStats.fromJson(json["weaponStats"])
          : null,
      shopData:
          json["shopData"] != null ? ShopData.fromJson(json["shopData"]) : null,
      skins: json["skins"] != null
          ? List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "category": category,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "weaponStats": weaponStats!.toJson(),
        "shopData": shopData!.toJson(),
        "skins": List<dynamic>.from(skins!.map((x) => x.toJson())),
      };
}

class WeaponStats {
  double? fireRate;
  double? magazineSize;
  double? equipTimeSeconds;
  double? reloadTimeSeconds;
  String? wallPenetration;
  String? feature;
  List<DamageRanges>? damageRanges;
  WeaponStats(
      {this.fireRate,
      this.magazineSize,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.wallPenetration,
      this.feature,
      this.damageRanges});
  factory WeaponStats.fromJson(Map<String, dynamic> json) => WeaponStats(
        fireRate: json["fireRate"].toDouble() ?? 0.0,
        magazineSize: json["magazineSize"].toDouble() ?? 0.0,
        equipTimeSeconds: json["equipTimeSeconds"].toDouble() ?? 0.0,
        reloadTimeSeconds: json["reloadTimeSeconds"].toDouble() ?? 0.0,
        wallPenetration: json["wallPenetration"],
        feature: json["feature"] ?? "Boş",
        damageRanges: List<DamageRanges>.from(
            json["damageRanges"].map((x) => DamageRanges.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fireRate": fireRate,
        "magazineSize": magazineSize,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "wallPenetration": wallPenetration,
        "feature": feature,
        "damageRanges":
            List<dynamic>.from(damageRanges!.map((x) => x.toJson())),
      };
}

class ShopData {
  double? cost;
  String? category;
  String? categoryText;
  GridPosition? gridPosition;
  ShopData({this.cost, this.category, this.categoryText, this.gridPosition});

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"].toDouble() ?? 0.0,
        category: json["category"],
        categoryText: json["categoryText"],
        gridPosition: json["gridPosition"] != null
            ? GridPosition.fromJson(json["gridPosition"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "categoryText": categoryText,
        "gridPosition": gridPosition!.toJson(),
      };
}

class GridPosition {
  double? row;
  double? column;
  GridPosition({this.row, this.column});

  factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json["row"].toDouble() ?? 0.0,
        column: json["column"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
      };
}

class Skin {
  Skin({
    required this.uuid,
    required this.displayName,
    required this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    required this.assetPath,
    this.chromas,
    this.levels,
  });

  final String uuid;
  final String displayName;
  final String themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final dynamic wallpaper;
  final String assetPath;
  List<Chroma>? chromas;
  List<Level>? levels;

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"],
        displayIcon: json["displayIcon"],
        wallpaper: json["wallpaper"],
        assetPath: json["assetPath"],
        chromas: json["chromas"] != null
            ? List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x)))
            : null,
        levels: json["levels"] != null
            ? List<Level>.from(json["levels"].map((x) => Level.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "themeUuid": themeUuid,
        "contentTierUuid": contentTierUuid,
        "displayIcon": displayIcon,
        "wallpaper": wallpaper,
        "assetPath": assetPath,
        "chromas": List<dynamic>.from(chromas!.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels!.map((x) => x.toJson())),
      };
}

class Chroma {
  Chroma({
    required this.uuid,
    required this.displayName,
    this.displayIcon,
    required this.fullRender,
    this.swatch,
    required this.streamedVideo,
    required this.assetPath,
  });

  final String uuid;
  final String displayName;
  final String? displayIcon;
  final String fullRender;
  final String? swatch;
  final dynamic streamedVideo;
  final String assetPath;

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "fullRender": fullRender,
        "swatch": swatch,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class Level {
  Level({
    required this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    required this.assetPath,
  });

  final String uuid;
  final String? displayName;
  final String? levelItem;
  final String? displayIcon;
  final String? streamedVideo;
  final String assetPath;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: json["levelItem"],
        displayIcon: json["displayIcon"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItem,
        "displayIcon": displayIcon,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class DamageRanges {
  final double? rangeStartMeters;
  final double? rangeEndMeters;
  final double? headDamage;
  final double? bodyDamage;
  final double? legDamage;

  DamageRanges({
    this.rangeEndMeters,
    this.rangeStartMeters,
    this.bodyDamage,
    this.headDamage,
    this.legDamage,
  });
  factory DamageRanges.fromJson(Map<String, dynamic> json) => DamageRanges(
        rangeStartMeters: json["rangeStartMeters"].toDouble() ?? 0.0,
        rangeEndMeters: json["rangeEndMeters"].toDouble() ?? 0.0,
        headDamage: json["headDamage"].toDouble() ?? 0.0,
        bodyDamage: json["bodyDamage"].toDouble() ?? 0.0,
        legDamage: json["legDamage"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "rangeStartMeters": rangeStartMeters,
        "rangeEndMeters": rangeEndMeters,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
      };
}
