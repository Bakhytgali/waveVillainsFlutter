import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:flutter_villains/villains/villains.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Villain(
          villainAnimation: VillainAnimation.fade(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Main Screen!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Villain(
                villainAnimation: VillainAnimation.fromBottom(
                  relativeOffset: 0.4,
                  from: Duration(milliseconds: 200),
                  to: Duration(milliseconds: 800),
                ),
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.blue, Color(0x77ff0000)],
                      [Colors.blue[800]!, Color(0x8800ff00)],
                      [Colors.blue[400]!, Color(0x99ffff00)]
                    ],
                    durations: [5000, 4000, 3000],
                    heightPercentages: [0.25, 0.26, 0.27],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  backgroundColor: Colors.blue,
                  size: Size(double.infinity, 200),
                  waveAmplitude: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Villain(
        villainAnimation: VillainAnimation.fade(),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'This is the second page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
