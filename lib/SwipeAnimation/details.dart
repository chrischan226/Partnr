import 'package:Partnr/SwipeAnimation/data.dart';
import 'package:Partnr/SwipeAnimation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Map<int, Color> color =
    {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
    };

MaterialColor colorCustom = MaterialColor(0xFFFFCDD2, color);

class DetailPage extends StatefulWidget {
  final DecorationImage type;
  const DetailPage({ Key key, this.type }) : super(key: key);
  @override
  _DetailPageState createState() => new _DetailPageState(type: type);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> height;
  DecorationImage type;
  _DetailPageState({this.type});
  List data = imageData;
  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = new AnimationController(
      duration: new Duration(milliseconds: 2000), vsync: this);
    super.initState();

    width = new Tween<double>(
      begin: 220.0,
      end: 220.0).animate(
        new CurvedAnimation(
          parent: _containerController,
          curve: Curves.ease,
        ),
      );

    height = new Tween<double>(
      begin: 400.0,
      end: 400.0
      ).animate(new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );

    height.addListener(() {
      setState(() {
        if (height.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    int img = data.indexOf(type);
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: colorCustom,
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: height.value,
        color: colorCustom,
        child: new Hero(
          tag: "img",
          child: new Card(
            color: Colors.transparent,
            child: new Container(
              alignment: Alignment.center,
              width: width.value,
              height: height.value,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: new IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                          title: new Text("Julio Fuentes", style: new TextStyle(color: Colors.white)),
                          background: new Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              new Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: new BoxDecoration(
                                  image: data[img],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                          new Container(
                            color: Colors.white,
                            child: new Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    padding: new EdgeInsets.only(bottom: 20.0),
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            bottom: new BorderSide(
                                                color: Colors.black12))),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new Icon(
                                              Icons.star_border,
                                              color: colorCustom,
                                            ),
                                            new Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text("5/5"),
                                            )
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new Icon(
                                              Icons.link,
                                              color: colorCustom,
                                            ),
                                            new Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text("github.com/juliofuentes", style: new TextStyle(color: Colors.lightBlue)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 8.0),
                                    child: new Text(
                                      "ABOUT",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Text(
                                      "I have worked in a wide variety of jobs ranging from the radio industry, to computer programming, to being a pro eSports-athlete! No matter what the job, I've gotten ahead because I've honed my ability to communicate with people in a manner that is simple, straight forward yet full of positivity and charisma! \n\nYour project needs somebody who is competent, has the brains to understand and execute, but brings a positive spirit that radiates and spreads to everyone. Look no further! Thank you for considering me! "),
                                  new Container(
                                    margin: new EdgeInsets.only(top: 25.0),
                                    padding: new EdgeInsets.only(
                                        top: 5.0, bottom: 10.0),
                                    height: 120.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            top: new BorderSide(
                                                color: Colors.black12))),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          "Recommendations",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new CircleAvatar(
                                                backgroundImage: avatar1),
                                            new CircleAvatar(
                                              backgroundImage: avatar2,
                                            ),
                                            new CircleAvatar(
                                              backgroundImage: avatar3,
                                            ),
                                            new CircleAvatar(
                                              backgroundImage: avatar4,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    height: 100.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  new Container(
                      width: 600.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                        color: colorCustom,
                      ),
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () {},
                              child: new Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: new BorderRadius.circular(60.0),
                                ),
                                child: new Text(
                                  "Pass",
                                  style: new TextStyle(color: Colors.white),
                                ),
                              )),
                          new FlatButton(
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: new Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: new BorderRadius.circular(60.0),
                                ),
                                child: new Text(
                                  "Howdy",
                                  style: new TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}