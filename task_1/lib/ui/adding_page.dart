import 'package:flutter/material.dart';
import 'package:task_1/state/items_manager.dart';

class AddingPage extends StatelessWidget {
  AddingPage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: _controller,
                ),
              ),
              ElevatedButton(onPressed: () {
                ItemsManager.of(context).addItem(_controller.text);
                Navigator.pop(context);
              }, child: const Text('Add!')),
            ],
          ),
        ),
      ),
    );
  }
}
