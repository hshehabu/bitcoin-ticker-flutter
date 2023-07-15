import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'C227589F-D055-4B0F-93D3-586AECD817BF';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getData(String currency) async {

    Map<String,String> cryptoCurrencies= {};
    for(String crypto in cryptoList) {
      Uri uri = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$apiKey');
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        cryptoCurrencies[crypto] = decodedData['rate'].toStringAsFixed(1);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoCurrencies;
  }
}
