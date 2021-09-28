import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String light = 'GREEN';
  String instruction = 'GO';
  Color? instructionColor = Colors.green[500];
  int _counter = 10;
  Timer? _timer;
  int num = 100;
  String textbutton = 'Start';

  @override
  void initState(){
    light = 'GREEN';
    instruction = 'GO';
    instructionColor = Colors.green[500];
    super.initState();
  }
  void _startTimer(){
    if(textbutton == 'Start')
    {
      textbutton = 'Stop';
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>0){
          _counter--;
        }
        else{
          setState(() {
            if(light == 'GREEN'){
            light == 'YELLOW';
            instruction = 'SLOW';
            instructionColor = Colors.yellow[500];
            _counter = 3;
          }
          else if(light == 'YELLOW'){
            light == 'RED';
            instruction = 'STOP!';
            instructionColor = Colors.red[500];
            _counter = 15;
          }
          else{
            light == 'GREEN';
            instruction = 'GO';
            instructionColor = Colors.green[500];
            _counter = 10;
          }
          });
        }
      });
     });
    }
    else if (textbutton == 'Stop')
    {
      textbutton = 'Start';
      _stopTimer();
    }
  }
  void _stopTimer(){
    _timer?.cancel();
  }
  int turnOnLight(String lightactive){
    if(light == lightactive){
      num = 500;
    }
    else{
      num = 100;
    }
    return num;
  }
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
                    color: Colors.green[turnOnLight('GREEN')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.orange[turnOnLight('YELLOW')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.red[turnOnLight('RED')],
                  )
                ],
              ),
              ElevatedButton(
                onPressed: _startTimer,
                child: Text(
                  textbutton,
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