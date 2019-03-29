import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.red,
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/lgback.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,primarySwatch: Colors.cyan,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.cyan,
                          fontSize: 20.0,
                        )
                      )
                    ),
                child: Container(
                  padding: const EdgeInsets.all(40.0) ,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email"
                          ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                      
                      new TextFormField(
                        decoration:
                            new InputDecoration(
                              labelText: "Enter password"
                              ),
                              
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(80.0) ,
                      ),
                      new MaterialButton(
                        color: Colors.cyan,
                        textColor: Colors.white,
                        child: new Text("Login"),
                        onPressed: ()=>{},
                        splashColor: Colors.blueAccent,
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
