import 'offer.dart';

class OffersModel {
  bool? status;
  int? code;
  String? message;
  List<Offer>? offers;

  OffersModel({this.status, this.code, this.message, this.offers});

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        offers: (json['offers'] as List<dynamic>?)
            ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'offers': offers?.map((e) => e.toJson()).toList(),
      };
}
