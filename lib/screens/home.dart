import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'contacts.dart';
import 'info.dart';
import 'news.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController pageController;
  String _message = '';

  @override
  void initState() {
     super.initState();
     pageController = PageController();
     getMessage();
     _register();
  }

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  void getMessage(){
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: PageView(
          controller: pageController,
          onPageChanged: (index){
            setState(() =>
              _currentIndex = index
            );
          },
          children: <Widget>[
            PreventionPage(),
            ContactsPage(),
            NewsPage(),
          ],
        ),
      ), bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
            pageController.jumpToPage(index);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.security),
              title: Text('Заштита'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.local_phone),
              title: Text('Контакти'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'Новости',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),/*
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),*/
          ],
        ),
    );
  }
}
