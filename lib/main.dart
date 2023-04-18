import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BGMI calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BGMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var msg = "";
  var bgcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.arrow_downward)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      label: Text('Enter your Height'),
                      prefixIcon: Icon(Icons.arrow_upward)),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    if (wt != "" && ft != "") {
                      var iwt = double.parse(wt);
                      var ift = double.parse(ft) * 0.3048;

                      var bmi = iwt / (ift * ift);
                      if (bmi > 25) {
                        bgcolor = Color.fromARGB(255, 255, 53, 53);
                        msg = "You are over weighted";
                      } else if (bmi < 18) {
                        bgcolor = Colors.grey;
                        msg = "You are under weighted";
                      } else {
                        bgcolor = Color.fromARGB(255, 97, 253, 58);
                        msg = "You are Healthy";
                      }
                      setState(() {
                        result = "Your BGMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        msg = "PLease fill all feilds";
                        bgcolor = Colors.red;
                      });
                    }
                  },
                  child: Text("calculate"),
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 20,
                    color: bgcolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class buyPage extends StatefulWidget {
//   @override
//   State<buyPage> createState() => _buyPageState();
// }

// class _buyPageState extends State<buyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HElmet"),
//       ),
//       body: Container(),
//     );
//   }
// }
