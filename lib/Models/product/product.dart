import 'product.dart';

class Product {
  bool? status;
  int? code;
  String? message;
  List<Product>? products;

  Product({this.status, this.code, this.message, this.products});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
