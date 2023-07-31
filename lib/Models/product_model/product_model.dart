import 'product.dart';

class ProductModel {
  bool? status;
  int? code;
  String? message;
  int? countProducts;
  int? totalCart;
  List<Product>? products;

  ProductModel({
    this.status,
    this.code,
    this.message,
    this.countProducts,
    this.totalCart,
    this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        countProducts: json['count_products'] as int?,
        totalCart: json['total_cart'] as int?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'count_products': countProducts,
        'total_cart': totalCart,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
