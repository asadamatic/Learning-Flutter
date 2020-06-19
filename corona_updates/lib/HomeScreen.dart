import 'package:coronaupdates/CountryData.dart';
import 'package:coronaupdates/WorldData.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> countries = List();
  List<Map<String, String>> countryMap = [];
  Map patientData = {};
  Map worldPatientData = {};
  List<String> options = ['World', 'Country'];
  String country = '';
  String option = 'Country';
  bool countryEnaled = true;
  double appBarheight = 150.0;
  Map data = {};

  void getWorldData() async{

    WorldData worldData = WorldData();
    worldPatientData = await worldData.getData();

  }
  void getData() async{
    String slug;
    countryMap.forEach((element) {
      if (element['Country'] == country){
        slug = element['Slug'];
      }
    });
    CountryData countryData = CountryData(slug: slug);
    patientData = await countryData.getData();

  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context).settings.arguments: data;
    countryMap = countryMap.isEmpty ? data['countryMap']: countryMap;
    countries = countries.isEmpty ? data['countries']: countries;
    country = country.isEmpty ? data['country']: country;
    patientData = patientData.isEmpty ? data['patientData']: patientData;
    worldPatientData = worldPatientData.isEmpty ? data['worldMap'] : worldPatientData;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
                IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                onPressed: (){
                  showAboutDialog(context: context,
                    applicationName: 'Corona Updates',
                    applicationVersion: '1.0',
                    applicationIcon: Image(
                      image: AssetImage('Assets/icon.png'),
                      height: 60.0,
                      width: 60.0,
                    ),);
                },
              ),
              IconButton(
              icon: Icon(
              Icons.perm_device_information,
              color: Colors.white,
              ),
              onPressed: (){
              showDialog(
              context: context,
              builder: (BuildContext context){
              return AlertDialog(
              actions: <Widget>[
              FlatButton(
              child: Text('Close'),
              onPressed: (){
              Navigator.of(context).pop();
              },
              )
              ],
              title: Text("Credits"),
              content: Container(
              height: 100.0,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('App Icons: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                  GestureDetector(
                  onTap: () async{
                  await launch('https://icons8.com/');
                  },
                  child: Text('Icons8', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,), ))
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Stats : ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                  GestureDetector(
                  onTap: () async{
                  await launch('https://covid19api.com/');
                  },
                  child: Text('Covid Api', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,),)
                  )
                ]
              ),
                  ],
              )
              ),
              );
              }
              );
              },
              ),

            ],
              elevation: 10.0,
              expandedHeight: 200.0,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){

                  WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                    appBarheight = constraints.biggest.height;
                  }));

                  return appBarheight > 180.0 ? FlexibleSpaceBar(
                    centerTitle: true,
                    title: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(right: 15.0),
                        margin: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Corona', style: TextStyle(fontFamily: "Lato-Black", color: Colors.white, fontSize: 24.0),),
                                Text('Updates', style: TextStyle(fontFamily: "Lato-Black", color: Colors.white, fontSize: 24.0),)
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('Assets/corona.png'),
                                  height: 50.0,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ): FlexibleSpaceBar();
                },
              )
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  Card(
                    margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    elevation: 5.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: option,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          isExpanded: true,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          onChanged: (String newValue) {
                            setState(() {
                              option = newValue;
                              countryEnaled = option == 'World' ? false : true;
                               if (option == 'World'){
                                 getWorldData();
                               }else {
                                 getData();
                               }
                            });
                          },
                          items: options.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.indigoAccent),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  countryEnaled ? Card(
                    margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 20.0),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    elevation: 5.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: FutureBuilder(
                        builder: (BuildContext context, AsyncSnapshot snapshot){

                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: country,
                              icon: Icon(Icons.arrow_downward),
                              iconDisabledColor: Colors.white,
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: countryEnaled ? (String newValue) {
                                setState(() {
                                  country = newValue;
                                  getData();
                                });
                              } : null,
                              items: countries.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: TextStyle(color: Colors.indigoAccent),),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ) : Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                  ),
                  InfoTile(title: 'INFECTED', count: countryEnaled ? patientData['confirmed']: worldPatientData['confirmed'], image: 'Assets/infected.png',),
                  countryEnaled ? InfoTile(title: 'ACTIVE', count: patientData['active'], image: 'Assets/active.png',) : Container(),
                  InfoTile(title: 'RECOVERED', count: countryEnaled ? patientData['recovered']: worldPatientData['recovered'], image: 'Assets/healthy.png',),
                  InfoTile(title: 'DEAD', count: countryEnaled ? patientData['dead']: worldPatientData['dead'], image: 'Assets/dead.png',)
                ]
            ),
          )
        ],
      ),
    );
  }
}

class InfoTile extends StatefulWidget{

  Key key;
  String title, count, image;
  InfoTile({this.title, this.count, this.image, this.key});

  @override
  State createState() {
    return InfoTileState();
  }
}

class InfoTileState extends State<InfoTile> {


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.count, style: TextStyle(fontSize: 24.0, color: Colors.indigoAccent, letterSpacing: 1.0, fontFamily: "Roboto"),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.title, style: TextStyle(fontSize: 18.0, color: Colors.indigoAccent, letterSpacing: 1.0, fontFamily: "Roboto"),),
                Image(
                  image: AssetImage(widget.image),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}