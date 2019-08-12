import 'dart:math';

import 'package:partnr/SwipeAnimation/details.dart';
import 'package:flutter/material.dart';

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

Positioned mainCard(
  DecorationImage img,
  double bottom,
  double right,
  double left,
  double cardWidth,
  double rotation,
  double skew,
  BuildContext context,
  Function dismissImg,
  int flag,
  Function addImg,
  Function swipeRight,
  Function swipeLeft) {

  Size screenSize = MediaQuery.of(context).size;
  return new Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {},
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          dismissImg(img);
        else 
          addImg(img);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight: Alignment.bottomLeft,
        transform: new Matrix4.skewX(skew),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
            flag == 0 ? rotation / 360 : -rotation / 360),
            child: new Hero(
              tag: 'img',
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(type: img),
                  ));
                },
                child: new Card(
                  color: Colors.transparent,
                  elevation: 4.0,
                  child: new Container(
                    alignment: Alignment.center,
                    width: screenSize.width / 1.2 + cardWidth,
                    height: screenSize.height / 1.7,
                    decoration: new BoxDecoration(
                      color: colorCustom,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.only(
                            topLeft: new Radius.circular(8.0),
                            topRight: new Radius.circular(8.0)),
                          image: img,
                      )
                    ),
                    new Container(
                      width: screenSize.width / 1.2 + cardWidth,
                      height: screenSize.height / 1.7 - screenSize.height / 2.2,
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new FlatButton(
                            padding: new EdgeInsets.all(0.0),
                            onPressed: () {
                              swipeLeft();
                              dismissImg();
                            },
                            child: new Container(
                              height: 60.0,
                              width: 130.0,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.red,
                                borderRadius: new BorderRadius.circular(60.0),
                              ),
                              child: new Text(
                                'Pass',
                                style: new TextStyle(color: Colors.white),
                              ),
                            )),
                            new FlatButton(
                            padding: new EdgeInsets.all(0.0),
                            onPressed: () {
                              swipeRight();
                              dismissImg();
                            },
                            child: new Container(
                              height: 60.0,
                              width: 130.0,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: new BorderRadius.circular(60.0),
                              ),
                              child: new Text(
                                'Howdy',
                                style: new TextStyle(color: Colors.white),
                              ),
                            )),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}