class CoronaCounter {
    final int Total_Cases_Mk;
    final int Total_Deaths_Mk;
    final int Total_Recovered_Mk;

    //final String Total_Cases_World;
    //final String Total_Deaths_World;
    //final String Total_Recovered_World;

    CoronaCounter({this.Total_Cases_Mk, this.Total_Deaths_Mk, this.Total_Recovered_Mk});

    //factory NewsReport.fromXML
    factory CoronaCounter.fromJson(Map<String, dynamic> json) {
      return CoronaCounter(
      Total_Cases_Mk: json['macedonia']["total_cases"],
      Total_Deaths_Mk: json['macedonia']["total_deaths"],
      Total_Recovered_Mk: json['macedonia']["total_recovered"],
    );
  }
}