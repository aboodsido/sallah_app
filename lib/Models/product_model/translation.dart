class Translation {
  int? id;
  int? productId;
  String? locale;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Translation({
    this.id,
    this.productId,
    this.locale,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        locale: json['locale'] as String?,
        name: json['name'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'locale': locale,
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };
}
