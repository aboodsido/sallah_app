import 'city.dart';

class CityModel {
  bool? status;
  int? code;
  String? message;
  List<City>? cities;

  CityModel({this.status, this.code, this.message, this.cities});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        cities: (json['cities'] as List<dynamic>?)
            ?.map((e) => City.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'cities': cities?.map((e) => e.toJson()).toList(),
      };
}
