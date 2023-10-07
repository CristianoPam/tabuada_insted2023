import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Colors.yellow,                
        appBar: AppBar(          
          centerTitle: true,
          title: const Text('TABUADA INSTED',style: TextStyle(color: Colors.black)), 
          backgroundColor: Colors.yellow,                             
        ),
        // ignore: prefer_const_constructors
        body: Container(
          margin: null,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),          
          decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://1.bp.blogspot.com/-tLlFDiULG_w/XykpKtHgOGI/AAAAAAAAL5I/EsPPUEiOKX8SE0BiCI6hub3DcDU1-MthwCLcBGAsYHQ/s2048/Naruto-Uzumaki-wallpaper.png'))  
          ),
          child: const TabuadaScreen()),
      ),
    );
  }
}

class TabuadaScreen extends StatefulWidget {
  const TabuadaScreen({super.key});

  @override
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  int selectedNumber = 1;
  List<int> tabuada = [];

  void generateTabuada() {
    setState(() {
      tabuada = List.generate(10, (index) => selectedNumber * (index + 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(              
      padding: const EdgeInsets.all(17.0),              
      child: Column(
        children: <Widget>[
          DropdownButton<int>(
            value: selectedNumber,
            alignment: Alignment.bottomCenter,
            elevation: 16,              
            style: const TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.w800),
            underline: Container(height: 2, color: Color.fromARGB(255, 243, 219, 3),),
            onChanged: (value) {
              setState(() {
                selectedNumber = value!;
                generateTabuada();
              });
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem<int>(
                value: index + 1,
                child: Text((index + 1).toString()),
              ),
            ),
          ),
          const SizedBox(height: 1),
          Text(
            'Tabuada de $selectedNumber:',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          if (tabuada.isNotEmpty)
            Column(

              children: tabuada
                  .map((result) => Container(
                    color: Colors.black26,
                    child: Text(
                          "$selectedNumber  x  ${(tabuada.indexOf(result) + 1).toString().padLeft(2, '0')}  =  ${result.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 45, color: Color.fromARGB(255, 243, 219, 3),fontWeight: FontWeight.w700),
                        ),
                  ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
