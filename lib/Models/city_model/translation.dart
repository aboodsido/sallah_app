class Translation {
  int? id;
  int? cityId;
  String? locale;
  String? name;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Translation({
    this.id,
    this.cityId,
    this.locale,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json['id'] as int?,
        cityId: json['city_id'] as int?,
        locale: json['locale'] as String?,
        name: json['name'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'city_id': cityId,
        'locale': locale,
        'name': name,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
