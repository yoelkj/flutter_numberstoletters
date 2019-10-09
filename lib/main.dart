import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Numbers to letters'),
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
  String _toLetter = 'No data';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number to letter page'),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter number.",
              labelText: "Number",
              counter: Text("$_toLetter"),
              prefixIcon: Icon(Icons.input),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
            ),
            onChanged: (value){
              setState(() {
                _toLetter = _numberToletter(value);
              });
            },
          )
        ],
      ),
    );
  }

  String _numberToletter(nb){
    
    String newString = '';
    int nbn = int.parse(nb);
    String strNumber = nbn.toString();
    int nchars = strNumber.length;
    
    Map nNotJoin = {1: 'Uno', 2: 'Dos', 3: 'Tres', 4: 'Cuatro', 5: 'Cinco', 6: 'Seis', 7: 'Siete', 8: 'Ocho', 9: 'Nueve', 10: 'Diez', 11: 'Once', 12: 'Doce', 13: 'Trece', 14: 'Catorce', 15: 'Quince'};
    Map deSufix = {1: "Dieci", 2: "Veinti", 3: "Treinta", 4: "Cuarenta", 5: "Cincuenta", 6: "Sesenta", 7: "Setenta", 8: "Ochenta", 9: "Noventa"};

    //Map cenSufix = {1: "Cien", 2: "Docientos", 3: "Trecientos", 4: "Cuatrocientos", 5: "Quinientos", 6: "Seiscientos", 7: "Setecientos", 8: "Ochocientos", 9: "Novecientos"};
    //String centName = 'Cien';
    //String milName = 'Mil';

    if(nbn < 16 ){
      newString = nNotJoin[nbn];
    }else if(nchars == 2 && nbn > 15){
      
      int fc = int.parse(strNumber.substring(0, 1));
      int sc = int.parse(strNumber.substring(1, 2));
      
      if(fc == 2 &&  sc == 0)      newString = 'Veinte';
      else if(fc != 2 &&  sc == 0) newString = deSufix[fc];
      else                         newString = deSufix[fc]+nNotJoin[sc];

    }else{
      newString = strNumber;
    }

    return newString;
  }
}
