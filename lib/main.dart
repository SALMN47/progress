import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myController = TextEditingController();
  int inputValue = 0;

  void parseValue() {
    final parsedvalu = int.tryParse(myController.text);
    if (parsedvalu != null && parsedvalu > 0 && parsedvalu < 100) {
      setState(() {
        inputValue = parsedvalu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAKE INT VALUE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'ENTER INT VALUE',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  parseValue();
                },
                child: Text('TAMAM')),
            SizedBox(
              height: 100,
            ),
            CircularPercentIndicator(
              center: Text(
                ' $inputValue %',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              lineWidth: 15,
              progressColor: Colors.green,
              backgroundColor: Colors.red,
              animationDuration: 1200,
              animation: true,
              radius: 60,
              percent: inputValue / 100,
              circularStrokeCap: CircularStrokeCap.round,
            )
          ],
        ),
      ),
    );
  }
}
