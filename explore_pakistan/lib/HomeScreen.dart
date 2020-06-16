
import 'package:explorepakistan/PlaceData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget{


  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{

  double sliverAppBarHeight = 200.0;
  List<PlaceData> places = PlaceList().getList();
  List<PlaceData> filteredList = List();


  TextEditingController searchController = TextEditingController();

  void clearSearch(){

    setState(() {

      searchController.clear();
      filteredList = places;
    });
  }
  void filterData(search){

    setState(() {
      if (search.isEmpty){

        filteredList = places;
      }else{
        filteredList = places;
        List<PlaceData> temporaryList = List();

        for (int index = 0; index < filteredList.length; index++){

          if (filteredList[index].title.toLowerCase().contains(search.toLowerCase()) || filteredList[index].description.toLowerCase().contains(search.toLowerCase()) ){
            temporaryList.add(filteredList[index]);
          }
        }
        filteredList = temporaryList;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredList = places;
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
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
                      applicationName: 'Explre Pakistan',
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
                              height: 120.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Content Source: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                              GestureDetector(
                                                  onTap: () async{
                                                    await launch('https://en.wikipedia.org/wiki/Tourism_in_Pakistan');
                                                  },
                                                  child: Text('Wikipedia', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,), ))
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Header Image: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                              GestureDetector(
                                                onTap: () async{
                                                  await launch('https://www.pexels.com/@waqas267');
                                                },
                                                child: Text('Waqas Ahmed', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,),)
                                              )
                                                  ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Welcome Screen: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                              GestureDetector(
                                                  onTap: () async{
                                                    await launch('https://www.pexels.com/@aakashraf');
                                                  },
                                                  child: Text('Aakash Ashraf', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,),)
                                              )
                                            ]
                                        ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Welcome Icon: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                          GestureDetector(
                                              onTap: () async{
                                                await launch('https://www.flaticon.com/authors/freepik');
                                              },
                                              child: Text('FlatIcon', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,),)
                                          )
                                        ]
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('App Icon: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                          GestureDetector(
                                              onTap: () async{
                                                await launch('https://www.flaticon.com/authors/freepik');
                                              },
                                              child: Text('FlatIcon', style: TextStyle(color: Colors.grey[800], fontSize: 15.0, height: 1.3,),)
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
              expandedHeight: 200.0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                     sliverAppBarHeight = constraints.biggest.height;
                  }));
                  return sliverAppBarHeight > 100.0 ? FlexibleSpaceBar(
                    centerTitle: true,
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Explore', style: TextStyle(fontFamily: "Lato-Black", color: Colors.white, fontSize: 16.0),),
                            Text('Pakistan', style: TextStyle(fontFamily: "Lato-Black", color: Colors.white, fontSize: 24.0),)
                          ],
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image(
                          image: AssetImage('Assets/header.jpg'),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.greenAccent.withOpacity(.3), Colors.green.withOpacity(.6),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) : FlexibleSpaceBar(
                    title: Text(''),
                  );
                },
              ),
            ),
            makeHeader(filterData, searchController, clearSearch,),
            SliverList(
              delegate: SliverChildListDelegate(
                  filteredList.map((place) => PlaceTile(place: place,)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverPersistentHeader makeHeader(Function filterData, TextEditingController searchController, Function clearSearch,) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 75.0,
        maxHeight: 75.0,
        filterData: filterData,
        searchController: searchController,
        clearSearch: clearSearch,
      ),
    );
  }
}


class PlaceTile extends StatelessWidget{

  PlaceData place;
  PlaceTile({this.place,});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/placeScreen', arguments: {
          'title': place.title,
          'description': place.description,
          'imageUrl': place.imageUrl,
          'credits': place.credits,
          'creditsUrl': place.creditsUrl,
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
        child: Card(
          margin: EdgeInsets.fromLTRB(17.0, 5.0, 17.0, 15.0),
          elevation: 6.0,
          child: Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: place.imageUrl,
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(place.imageUrl),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(.4), BlendMode.softLight),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.blueGrey.withOpacity(1), Colors.white.withOpacity(1)]
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                    child: Text(place.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 24.0, fontFamily: 'Lato-Bold',),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                    child: Text(place.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15.0, color: Colors.grey[700],fontFamily: 'Roboto-Light'),),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.filterData,
    @required this.searchController,
    @required this.clearSearch,
  });
  final double minHeight;
  final double maxHeight;
  final Function filterData;
  final Function clearSearch;
  TextEditingController searchController;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 9.0),
        height: maxHeight,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: searchController,
                style: TextStyle(fontFamily: "Roboto-Regular"),
                decoration: InputDecoration(
                  hintText: 'Search for places',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                cursorColor: Colors.green,
                onChanged: (value){
                  filterData(value);
                },
              ),
            ),
            FlatButton(
              child: Text('Clear'),
              color: Colors.transparent,
              onPressed: (){
                clearSearch();
              },
            )
          ],
        ),
      ),
    );
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}


