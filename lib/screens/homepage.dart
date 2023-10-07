import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tabuada App'),
        ),
        // ignore: prefer_const_constructors
        body: TabuadaScreen(),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton<int>(
              value: selectedNumber,
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
            const SizedBox(height: 20),
            Text(
              'Tabuada de $selectedNumber:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (tabuada.isNotEmpty)
              Column(
                children: tabuada
                    .map((result) => Text(
                          "$selectedNumber x ${(tabuada.indexOf(result) + 1).toString().padLeft(2, '0')} = ${result.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 40),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
