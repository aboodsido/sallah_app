import 'translation.dart';

class City {
  int? id;
  int? deliveryCost;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? name;
  List<Translation>? translations;

  City({
    this.id,
    this.deliveryCost,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.translations,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        deliveryCost: json['deliveryCost'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
        name: json['name'] as String?,
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'deliveryCost': deliveryCost,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'name': name,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
