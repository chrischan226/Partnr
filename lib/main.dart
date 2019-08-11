import 'package:flutter/material.dart';

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
        onPressed: (){print('test');},
        backgroundColor: colorCustom,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Applicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partnr', style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
