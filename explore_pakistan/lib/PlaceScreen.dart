
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceScreen extends StatefulWidget{


  @override
  State createState() {
    return PlaceScreenState();
  }
}

class PlaceScreenState extends State<PlaceScreen>{
  double sliverAppBarHeight = 200.0;
  Map data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: sliverAppBarHeight > 90.0 ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ) : null,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                    sliverAppBarHeight = constraints.biggest.height;
                  }));
                  return FlexibleSpaceBar(
                    centerTitle: true,

                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data['title'], maxLines: 2, style: TextStyle(fontFamily: "Lato-Black", color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                           ],
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(data['imageUrl']),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white70.withOpacity(0), BlendMode.softLight),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Photo Credits: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                            TextSpan(text: data['credits'], style: TextStyle(color: Colors.grey[700], fontSize: 14.0, height: 1.3,), recognizer: TapGestureRecognizer()..onTap = () async{
                              await launch(data['creditsUrl']);
                            },),
                          ]
                        )
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Text(data['description'], style: TextStyle(fontSize: 16.0, height: 1.3,), )
                          
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                      child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'Content Source: ', style: TextStyle(color: Colors.grey[600], fontSize: 14.0, height: 1.3,), ),
                                TextSpan(text: 'Wikipedia', style: TextStyle(color: Colors.grey[700], fontSize: 14.0, height: 1.3,), recognizer: TapGestureRecognizer()..onTap = () async{
                                  await launch('https://en.wikipedia.org/wiki/Tourism_in_Pakistan');
                                },)
                              ]
                          )
                      )
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}