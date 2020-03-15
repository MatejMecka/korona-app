import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage();

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  final _contacts = <String, String>{
  "Во Случај на нешто може овие броеви да ги контактирате": "",
  "ЦЈЗ Скопје": "+38971289614",
  "ИЈЗ Скопје": "+38978387194",
  "ЦЈЗ Велес": "+38971219278",
  "ЦЈЗ Битола": "+38971261330",
  "ЦЈЗ Кочани": "+38971373913",
  "ЦЈЗ Куманово": "+38970215851",
  "ЦЈЗ Охрид": "+38970723029",
  "ЦЈЗ Прилеп": "+38976475747",
  "ЦЈЗ Струмица": "+3897235543",
  "ЦЈЗ Тетово": "+38975240464",
  "ЦЈЗ Штип": "+38978365613",
  "ПЕ Гевгелија": "+38978545444",
  "ПЕ Гостивар": "+38976365161",
  "3Д Ало Докторе": "0215123",
};


  _launchCaller(value) async { 
    if (await canLaunch('tel:${value}')) {
       await launch(value);
    } else {
      throw 'Could not launch $value';
    }   
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildContacts()
        ),
    );
  }


  Widget buildContacts(){
    return new ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            String key = _contacts.keys.elementAt(index);
            String value = _contacts[key];
            if(index == 0 ){
              return Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Во случај да ги поседувате симптомите на корона вирусот може овие броеви да ги контактирате\n", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)
                  )
                );
            } else{ 
            return new Column(
              children: <Widget>[
                 new GestureDetector(
                  child: Container(
                    color:(index % 2 == 0) ? Colors.white : Colors.blue[50],
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(key),
                      subtitle: Text(value),
                      ),
                    ),
                    onTap: () => _launchCaller(value),
                ),
                ],
              );
            };
          }
          );
  }




}