import 'package:currency_converter/models/ratesmodelfromjson.dart';
import 'package:currency_converter/utils/key.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + key)) ;
  print(response.body);
  final result = ratesModelFromJson(response.body);

  return result;
}

Future<Map> fetchcurrencies() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}