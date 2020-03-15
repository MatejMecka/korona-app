import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( child: WebView(
        initialUrl: 'https://gdi-sk.maps.arcgis.com/apps/opsdashboard/index.html#/2096bd4b051b42948ac3f5747e80c3a5',
        javascriptMode: JavascriptMode.unrestricted,
        )
      ) 
    );
  }
}