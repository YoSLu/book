import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _press = 0;
  double start = 100.0;
  double _index  = 1.1;
  double _mutualfund = 1.07;
  double _saving = 1.02;
  int _mutuallose = 100;
  int  _savinglose = 100;

  int _index_return = 0;
  int  _mutualfund_return = 0;
  int  _saving_return = 0;

  int return_cal(double start, double cal){
    double _in_key = 1.0;
    double k;
    int temp = 0;
    for (int i = 0; i < _press; i++){
      _in_key = _in_key * cal;
    }
    k = _in_key * start;
    temp = k.toInt();
     return (temp);
  }

  int lose(int getB, int getIn){
    double temp = getB * 100 / getIn;
    int tempA = temp.toInt();
    return tempA;
  }



  void _incrementCounter() {
    setState(() {
      _press+=1;
      _index_return = return_cal(start, _index);
      _mutualfund_return = return_cal(start, _mutualfund);
      _saving_return = return_cal(start, _saving);

        _mutuallose = lose(_mutualfund_return, _index_return);
        _savinglose = lose(_saving_return, _index_return);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '100元長期投資$_press年\n',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '10% 回報率   $_index_return  元\n',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '基金回報率7.5 %  $_mutualfund_return   元'
              '價值剩下$_mutuallose %\n',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '放定存 2%  $_saving_return  元, 價值剩下 $_savinglose %\n',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}