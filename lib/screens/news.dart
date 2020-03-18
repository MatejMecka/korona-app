import 'package:Korona/models/analytics.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../requests/newsRequests.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import '../screens/home.dart';

class NewsPage extends StatefulWidget {
  @override
  get screenName => 'News';

  NewsPage();
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  var _newsObjects = [];
  bool _loading = true;
  final now = new DateTime.now();
/*
  final snackBar = SnackBar(content: Text('Се Вчитува...'),
  action: SnackBarAction(
    label: 'Во Ред',
    onPressed: () {

    },
  ),);
*/
  @override
  void initState() {
    //Scaffold.of(context).showSnackBar(snackBar);
    getNews().then((value){
      setState(()  => _newsObjects = value);

      for(var i=0; i < _newsObjects.length; i++){
        print(_newsObjects[i].pubDate);
      }
    });
    super.initState();
  }

  _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  
_calculateDate(rssDate){
  //final diff = now.subtract()
  var formatedDay = rssDate.replaceAll("+0000", '');
  var substr = formatedDay.substring(0,4);
  var moreFormatting = formatedDay.replaceAll(substr, '');
  print(moreFormatting);
  /*print(Jiffy(moreFormatting));
  var moreFormatting = formatedDay.replace();
  print(DateTime.parse(formatedDay.replace(formatedDay.substring(1,4), '')));
  var nesho = DateFormat("E").parse(rssDate);
  print(DateFormat("E, dd MM yyyy hh:mm:ss").parse(rssDate));
  print(DateTimeFormat.format(rssDate));*/
  return moreFormatting;
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: _newsObjects.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text("${_newsObjects[index].title} - ${_newsObjects[index].pubDate}"),
                  dense: true,
                  leading: Icon(Icons.message),
                  subtitle: Text(_newsObjects[index].description.substring(0,120) + "..."),
                  onTap: () => _launchURL(_newsObjects[index].link),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              );
            },
          ),
        ),
      );
  }



}