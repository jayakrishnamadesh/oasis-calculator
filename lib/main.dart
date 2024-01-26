import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, 
      ),
      home : HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Calculator')),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.w700,
              ),
            ),
           ),
          ),
           Padding(padding: EdgeInsets.all(25.0)),
           Row(
            children: <Widget>[
            customOutlineButton('9'),
            const SizedBox(width: 6),
            customOutlineButton('8'),
            const SizedBox(width: 6),
            customOutlineButton('7'),
            const SizedBox(width: 6),
            customOutlineButton('+'),
            

            ],
          ),
                     Row(
            children: <Widget>[
            customOutlineButton('6'),
            const SizedBox(width: 6),
            customOutlineButton('5'),
            const SizedBox(width: 6),
            customOutlineButton('4'),
            const SizedBox(width: 6),
            customOutlineButton('-'),
            

            ],
          ),
                     Row(
            children: <Widget>[
            customOutlineButton('3'),
            const SizedBox(width: 6),
            customOutlineButton('2'),
            const SizedBox(width: 6),
            customOutlineButton('1'),
            const SizedBox(width: 6),
            customOutlineButton('x'),
            

            ],
          ),
                     Row(
            children: <Widget>[
            customOutlineButton('C'),
            const SizedBox(width: 6),
            customOutlineButton('0'),
            const SizedBox(width: 6),
            customOutlineButton('='),
            const SizedBox(width: 6),
            customOutlineButton('/'),
            

            ],
          )

         
            ],
          )
        
        ),
       );
      
  }

  Widget customOutlineButton(String val) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton(
         style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0), // Adjust the width as needed
        ),
    
              onPressed: ()=>btnclicked(val),
              child: Text(
                val,
                style: TextStyle(fontSize: 80.0),
              ),
            ),
    );
  }
  int first=0;
  int second=0;
  String opp='';
  String res=""; String text="";
  void btnclicked(String btnText)
  {
    if (btnText =='C'){
      res ='';
      text='';
      first=0;
      second=0;
    }
    else if (btnText=='+' || btnText == "-" || btnText == 'x' || btnText == '/'){
      first =int.parse(text);
      res = '';
      opp=btnText;

    }
    
    else if (btnText == '='){
      second = int.parse(text);

      if (opp == '+'){
        res = (first+second).toString();
      }

      if (opp == '-'){
        res = (first-second).toString();
      }

      if (opp == 'x'){
        res = (first*second).toString();
      }

      if (opp == '/'){
        res = (first ~/ second).toString();
      }

    

    }

    else{
      res = int.parse(text + btnText).toString();
    }
 
  setState(() {
    text = res;
  });

  }
}