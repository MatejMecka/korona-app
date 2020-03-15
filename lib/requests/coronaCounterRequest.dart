import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/coronaCounterModel.dart';

 Future<CoronaCounter> getCoronaCounter() async {
      final http.Response response = await http.get('https://motley-avocado.glitch.me/corona');
      if(response.statusCode == 200){
        print(response.body);
        return CoronaCounter.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load request');
      }
 }