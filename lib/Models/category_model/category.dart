import 'translation.dart';

class Category {
  int? id;
  String? image;
  String? status;
  DateTime? createdAt;
  String? name;
  List<Translation>? translations;

  Category({
    this.id,
    this.image,
    this.status,
    this.createdAt,
    this.name,
    this.translations,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        image: json['image'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        name: json['name'] as String?,
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'name': name,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
