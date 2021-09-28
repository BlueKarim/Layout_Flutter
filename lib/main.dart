import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String light = 'green';
  String instruction = 'GO';
  Color? instructionColor = Colors.green[500];
  int _counter = 30;
  String textButton = 'Start';
  Timer? timer;

  void initState(){
    light = 'green';
    instruction = 'GO';
    instructionColor = Colors.green[500];
    _counter = 30;
    super.initState();
  }
  void Start(){
    if(textButton == 'Start' )
    {
      textButton = 'Stop';
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if(_counter >0)
          {
            _counter--;
          }
          else
          {
            if(light == 'green')
            {
              light = 'yellow';
              instruction = 'SLOW';
              instructionColor = Colors.yellow[500];
              _counter = 3;
            }
            else if(light == 'yellow')
            {
              light = 'red';
              instruction = 'STOP!';
              instructionColor = Colors.red[500];
              _counter = 15;
            }
            else
            {
              light = 'green';
              instruction = 'GO';
              instructionColor = Colors.green[500];
              _counter = 30;
            }
          }
        });
       });
    }
    else
    {
      textButton = 'Start';
      timer?.cancel();
    }
  }
  int turnOnLight(String lightactive){
    int num = 100;
    if (light ==lightactive){
      num = 500;
    }
    return num;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traffic light",
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue[600]),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Traffic light"),
          backgroundColor: Colors.blue[600],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                instruction,
                style: TextStyle(
                  fontSize: 32,
                  color: instructionColor,
                ),
              ),
              Text(
                _counter.toString(),
                style: TextStyle(
                  fontSize: 32,
                  color: instructionColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.green[turnOnLight('green')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.orange[turnOnLight('yellow')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.red[turnOnLight('red')],
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.directions_walk,
                    size: 150,
                    color: Colors.red[turnOnLight('red')],
                  ),
                  Icon(
                    Icons.directions_walk,
                    size: 150,
                    color: Colors.green[(turnOnLight('green'))],
                  )
                ],
              ),
              ElevatedButton(
                onPressed: Start,
                child: Text(
                  textButton,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ))
            ],
          ),
        )
        ),
    );
  }
}