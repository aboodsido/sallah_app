import 'translation.dart';

class Offer {
  int? id;
  int? categoryId;
  int? price;
  String? image;
  int? discount;
  String? offerFrom;
  String? offerTo;
  int? type;
  int? order;
  int? available;
  String? status;
  DateTime? createdAt;
  String? isCart;
  String? availableOffer;
  double? priceOffer;
  String? typeName;
  int? availableInt;
  String? name;
  dynamic description;
  List<Translation>? translations;

  Offer({
    this.id,
    this.categoryId,
    this.price,
    this.image,
    this.discount,
    this.offerFrom,
    this.offerTo,
    this.type,
    this.order,
    this.available,
    this.status,
    this.createdAt,
    this.isCart,
    this.availableOffer,
    this.priceOffer,
    this.typeName,
    this.availableInt,
    this.name,
    this.description,
    this.translations,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json['id'] as int?,
        categoryId: json['category_id'] as int?,
        price: json['price'] as int?,
        image: json['image'] as String?,
        discount: json['discount'] as int?,
        offerFrom: json['offer_from'] as String?,
        offerTo: json['offer_to'] as String?,
        type: json['type'] as int?,
        order: json['order'] as int?,
        available: json['available'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        isCart: json['is_cart'] as String?,
        availableOffer: json['available_offer'] as String?,
        priceOffer: (json['price_offer'] as num?)?.toDouble(),
        typeName: json['type_name'] as String?,
        availableInt: json['available_int'] as int?,
        name: json['name'] as String?,
        description: json['description'] as dynamic,
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'price': price,
        'image': image,
        'discount': discount,
        'offer_from': offerFrom,
        'offer_to': offerTo,
        'type': type,
        'order': order,
        'available': available,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'is_cart': isCart,
        'available_offer': availableOffer,
        'price_offer': priceOffer,
        'type_name': typeName,
        'available_int': availableInt,
        'name': name,
        'description': description,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
