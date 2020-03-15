import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webfeed/webfeed.dart';


 getNews() async {
      http.Response response = await http.get('http://zdravstvo.gov.mk/?feed=rss');
      if(response.statusCode == 200){
        final rssFeed = new RssFeed.parse(response.body);
        return rssFeed.items;
      } else {
        throw Exception('Failed to load news');
      }
 }