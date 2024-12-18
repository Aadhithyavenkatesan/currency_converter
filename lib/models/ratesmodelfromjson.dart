import 'dart:convert';

RatesModel ratesModelFromJson(String str) => RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson());

class RatesModel {
  RatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        disclaimer: json["disclaimer"] ?? '',
        license: json["license"] ?? '',
        timestamp: json["timestamp"] ?? 0,
        base: json["base"] ?? '',
        rates: json["rates"] == null
            ? {}
            : Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(
                k, (v is num ? v.toDouble() : 0.0))),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
