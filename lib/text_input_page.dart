import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputPage extends StatefulWidget {
  @override
  _TextInputPageState createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  String inputted = "initial";
  final TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(inputted),
          TextField(
            controller: controller,
            onEditingComplete: () {
              setState(() {
                inputted = controller.text;
              });
            },
          ),
          CupertinoButton(
            child: Icon(Icons.done_outline),
            onPressed: () {
              setState(() {
                inputted = controller.text;
              });
            },
          ),
        ],
      ),
    );
  }
}
