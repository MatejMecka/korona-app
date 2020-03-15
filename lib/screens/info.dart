import 'package:Korona/models/coronaCounterModel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../requests/coronaCounterRequest.dart';
import '../models/coronaCounterModel.dart';
import '../models/questionsAndAnswersModel.dart';
import  '../my_flutter_app_icons.dart';

class PreventionPage extends StatefulWidget {
  PreventionPage();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _PreventionPageState createState() => new _PreventionPageState([
    QuestionsAndAnswers("Дали домашните миленици можат да го пренесуваат новиот коронавирус (2019-nCoV)?", "Во моментов, нема докази дека животните - придружници/домашни миленици, како кучиња или мачки можат да бидат заразени со новиот коронавирус", false),
    QuestionsAndAnswers("Дали новиот коронавирус ги зафаќа постарите луѓе, или и помладите се исто така осетливи на инфекција?", "Луѓето од сите возрасти можат да бидат заразени од новиот коронавирус (2019-nCoV).\nПостарите лица и лицата со хронични заболувања (како астма, дијабетес, срцеви заболувања) се чини дека се поосетливи на сериозно заболување од вирусот.", false),
    QuestionsAndAnswers("Дали антибиотиците се ефикасни во превенцијаи лекување на новиот коронавирус?", "Не, антибиотиците не делуваат на вирусите, само на бактериите.", false),
    QuestionsAndAnswers("Дали постојат специфични лекови за превенција или лекување на новиот коронавирус?","До денес, не е препорачан специфичен лек за превенција или лекување на новиот коронавирус (2019-nCoV)",false),
    QuestionsAndAnswers("Дали постоечките вакцини против пневмонија може да Ве заштитат против новиот коронавирус (2019-nCoV)?","Не. Постоечките вакцини против пневмонија, како пневмококната вакцина и вакцината против Хемофилус инфлуенца тип Б (Hib)-инфекциите, не обезбедуваат заштита против новиот коронавирус (2019-nCoV).",false),
    QuestionsAndAnswers("Дали е безбедно да се добие писмо или пакет од Кина?","Луѓето кои примаат пакети од Кина, не се изложени на ризик да заболат од новиот коронавирус (2019-nCoV).\n Од претходни сознанија и анализи, знаеме дека коронавирусите не преживуваат долго на предмети, како што се писма или пакети.",false),
    //QuestionsAndAnswers("","",false),
  ]);
  
}

class _PreventionPageState extends State<PreventionPage> {
  Future<CoronaCounter> counter;
  List<QuestionsAndAnswers> _faq;
  _PreventionPageState(this._faq);

  @override
  void initState() {
    super.initState();
    counter = getCoronaCounter();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  ListView(children: <Widget>[ Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<CoronaCounter>(
          future: counter, 
          builder: (context, snapshot) {
          if(snapshot.hasData){
           print(snapshot.data.Total_Cases_Mk);
           return CarouselSlider(
            height: 125.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            pauseAutoPlayOnTouch: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            items: ['Случаи во Македонија\n ${snapshot.data.Total_Cases_Mk}',"Смртни Случаеви во Македонија\n ${snapshot.data.Total_Deaths_Mk}", "Излечени Случаи во Македонија\n ${snapshot.data.Total_Recovered_Mk}"].map((i) {
             return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[500],
                    ),
                    child: Center( child: Text('$i', style: TextStyle(fontSize: 24.0), textAlign: TextAlign.center,) )
                  );
                },
            );
          }).toList(),
        );
          } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
          } 
          print(snapshot.hasData);
          return Center(child: CircularProgressIndicator());
    
        },
      ), 
      ), 
      Padding(
        padding: EdgeInsets.all(5),
        child: Text(
        'Симптоми на Корона Вирус', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 28.0
        ),
        textAlign: TextAlign.center,
      ),
      ),
      
    Container(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
              leading: Icon(MyFlutterApp.cough, color: Colors.black),
              title: Text("Кашлица"),
          ),
          ListTile(
              leading: Icon(MyFlutterApp.temperature, color: Colors.black),
              title: Text("Треска"),
          ), 
          ListTile(
              leading: Icon(MyFlutterApp.headache_1_, color: Colors.black),
              title: Text("Главоболка"),
          ), 
          ListTile(
              leading: Icon(MyFlutterApp.nose, color: Colors.black),
              title: Text("Течење на носот"),
          ), 
          ListTile(
              leading: Icon(MyFlutterApp.sore_throat, color: Colors.black),
              title: Text("Воспалено грло"),
          ), 
        ],
      ),
    ), 


      Padding(
        padding: EdgeInsets.all(5), 
        child: Text(
        'Како да се заштите од Корона', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 28.0
        ),
        textAlign: TextAlign.center,
      )
      ),
    
    Container(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
              dense : true,
              leading: Icon(Icons.home, color: Colors.black),
              title: Text("Останете дома"),
          ),
          ListTile(
              leading: Icon(MyFlutterApp.hand_wash, color: Colors.black),
              title: Text("Миете ги вашите раце често"),
          ), 
          ListTile(
              leading: Icon(Icons.group, color: Colors.black),
              title: Text("Избегнувајте близок контакт"),
          ), 
          ListTile(
              leading: Icon(IconData(59378, fontFamily: 'MaterialIcons'), color: Colors.black,),
              title: Text("Избегнете да го допирате вашето лице"),
          ), 
          ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.black),
              title: Text("Побарајте медицинска помош ако ги имате овие симптоми"),
          ), 
        ],
      ),
    ), 



       Padding(
        padding: EdgeInsets.all(5), 
        child: Text(
        'Често Поставувани Прашања', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 28.0
        ),
        textAlign: TextAlign.center,
      ),
      ),
      
      
        _buildPanel()
    

      ]
      )
    );

    





  }

Widget _buildPanel() {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        _faq[index].expanded = !isExpanded;
      });
    },
    children: _faq.map<ExpansionPanel>((QuestionsAndAnswers item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child:ListTile(
            title: Text(item.title),
          ));
        },
        body: ListTile(
          title: Text(item.body),
        ),
        isExpanded: item.expanded,
      );
    }).toList(),
  );
}



}