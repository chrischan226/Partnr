import 'dart:async';
import 'package:Partnr/SwipeAnimation/data.dart';
import 'package:Partnr/SwipeAnimation/dummyCard.dart';
import 'package:Partnr/SwipeAnimation/activeCard.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: MyHomePage(title: 'Partnr'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
      body: ListView(
        children: <Widget>[
          new GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Applicants()),
              );
            },
          child: new Container(
            height: 225,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('graphics/kiss.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text('KissPal', style: TextStyle(color: Colors.white, fontSize: 28.0,)),
            alignment: Alignment(-0.9, 0.9),
          ),
        ),
          new GestureDetector(
            onTap: (){
              print('clicked');
            },
            child: new Container(
              height: 225,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('graphics/funcle.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('Funcle',  style: TextStyle(color: Colors.white, fontSize: 28.0)),
              alignment: Alignment(-0.9, 0.9),
            ),
          ),
          new GestureDetector(
            onTap: (){
              print('clicked');
            },
            child: new Container(
              height: 225,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('graphics/matrix.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('Movie List',  style: TextStyle(color: Colors.white, fontSize: 28.0)),
              alignment: Alignment(-0.9, 0.9),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorCustom,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home, size: 35.0), onPressed: () {}, color: Colors.white,),
            IconButton(icon: Icon(Icons.search, size: 35.0), onPressed: () {}, color: Colors.white,),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){  
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Projects()),
              );
        },
        backgroundColor: colorCustom,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Projects extends StatefulWidget {
  @override 
  ProjectsState createState() => new ProjectsState();
}

class ProjectsState extends State<Projects> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final name = TextEditingController();
  final desc = TextEditingController();
  final img = TextEditingController();
  String _name;
  String _description;
  String _image;

  void initState() {
   name.addListener(() {
     final text = name.text.toLowerCase();
     name.value = name.value.copyWith(
       text: text,
       selection:
           TextSelection(baseOffset: text.length, extentOffset: text.length),
       composing: TextRange.empty,
     );
   });
   super.initState();
 }

  void dispose() {
    name.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Partnr', style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
      body: Center(
          child: new Container (
          width: 350.0,
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(8.0),),
                new TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Project Name' 
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (v) => setState((){_name = v;}),
                  controller: name,
                ),
                Padding(padding: const EdgeInsets.all(8.0),),
                new TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description' 
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (v) => setState((){_description = v;}),
                  controller: desc,
                ),
                Padding(padding: const EdgeInsets.all(8.0),),
                new TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Image' 
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter link to image';
                    }
                    return null;
                  },
                  onSaved: (v) { setState((){_image = v;});},
                  controller: img,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),                  
                  child: Container(
                    child: ButtonTheme(
                    height: 45.0,
                    child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        name.text = "";
                        desc.text = "";
                        img.text = "";
                      }
                    },
                    child: Text('Submit'),
                  ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Applicants extends StatefulWidget {
  @override
  ApplicantsState createState() => new ApplicantsState();
}

class ApplicantsState extends State<Applicants> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = imageData;
  List selectedData = [];
  void initState() {
    super.initState();

    _buttonController = new AnimationController(
      duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0, 
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
        ),
      );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);
          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );

    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );

    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );      
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
      _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
      _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;

    return (new Scaffold(
      appBar: AppBar(
        title: Text('Partnr', style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
      body: new Container(
        alignment: Alignment.center,
        child : dataLength > 0
          ? new Stack(
            alignment: AlignmentDirectional.center,
            children: data.map((item) {
              if (data.indexOf(item) == dataLength - 1) {
                return mainCard(
                  item,
                  bottom.value,
                  right.value,
                  0.0,
                  backCardWidth + 10,
                  rotate.value,
                  rotate.value < -10 ? 0.1 : 0.0,
                  context,
                  dismissImg,
                  flag,
                  addImg,
                  swipeRight,
                  swipeLeft);
              } else {
                backCardPosition = backCardPosition - 10;
                backCardWidth = backCardWidth + 10;

                return dummy(item, backCardPosition, 0.0, 0.0,
                backCardWidth, 0.0, 0.0, context);
              }
            }).toList())
            : new Text("No more Applicants!",
              style: new TextStyle(color: Colors.black, fontSize: 30.0)),
            )));
  }
}
