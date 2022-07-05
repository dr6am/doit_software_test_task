import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_1/state/items_manager.dart';
import 'package:task_1/ui/adding_page.dart';

import 'consts.dart';

/// +--------------------------------------------------------+
/// | TASK DETAILS:                                          |
/// |--------------------------------------------------------|
/// | This tasks will look at the methods you use to         |
/// | optimise code for good in app performance.             |
/// |                                                        |
/// | Part 1:                                                |
/// | In order to complete this task you will need to        |
/// | display a list of 2000 shopping items.                 |
/// | - This list should be randomly generated and be 2000   |
/// |   items long. (Duplicate items are okay, as long as    |
/// |   they are random)                                     |
/// | - The possible items are provided in the consts.dart   |
/// |   file that should be in the current directory.        |
/// | - Each item in the list should be capitalised          |
/// |                                                        |
/// | Part 2:                                                |
/// | In order to complete this part of the task you will    |
/// | to add some functionality to the app.                  |
/// | Please add a way to add items to the shopping list.    |
/// | - The items added should always go to the top of the   |
/// |   list.                                                |
/// | - You may use libraries but they should not be needed. |
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
    return ItemsManager(
      child: MaterialApp(
        title: 'DOit Software Task 1',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final items = ItemsManager.of(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task One"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => AddingPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder<Iterable<String>>(
          valueListenable: items,
          builder: (BuildContext context, Iterable<String> data, _) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(data.elementAt(index).capitalizedCase()),
                    ));
          }),
    );
  }
}

Iterable<String> genItems({required int length}) sync* {
  var rand = Random();
  for (int index = 0; index <= length; index++) {
    String item = List.generate(
        2, (_) => wordList.elementAt(rand.nextInt(wordList.length))).join(' ');
    yield item;
  }
}

extension CapitalizedCase on String {
  String capitalizedCase() =>
      [this[0].toUpperCase(), substring(1).toLowerCase()].join();
}
