import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState()=>LoginPageState();
}


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 499),
    );
    _iconAnimation=CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/coding_image.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value*100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                    )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                          labelText: "User Name or Email",
                          ),
                        keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                          labelText: "Password",
                          ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                        ),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 99.9,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text("Login"),
                          onPressed: ()=>{},
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}
