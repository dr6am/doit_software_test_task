import 'package:flutter/material.dart';
import 'package:test_task_2_debugging/pages/auth.dart';
import 'package:test_task_2_debugging/pages/splash.dart';

/// +--------------------------------------------------------+
/// | TASK DETAILS:                                          |
/// |--------------------------------------------------------|
/// | This tasks will look at the methods you use to         |
/// | optimise and debug code.                               |
/// |                                                        |
/// | In order to complete this task you will need to        |
/// | debug this simple app. There are errors and code       |
/// | discrepancies through out the 3 files in this app.     |
/// | You will need to find and fix them in order to         |
/// | complete this task.                                    |
/// |                                                        |
/// | Notes:                                                 |
/// | - Please comment your code where possible (if time     |
/// |   allows for it)                                       |
/// | - Libraries are allowed to be used but are not         |
/// |   necessary for the task at hand.                      |
/// +--------------------------------------------------------+

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      routes: {
        "home": (ctx) => const SplashScreen(),
        "/auth": (ctx) => const AuthPage(),
        "/main": (ctx) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOit Task Two"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
