import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:integration_tests/text_input_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String selected;
  List<int> indexes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Current selected is $selected"),
          CupertinoButton(
            child: Text("To text input"),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextInputPage();
              }));
            },
          ),
          Expanded(
            child: ListView.builder(
                itemCount: indexes.length,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    child: Text(indexes[index].toString()),
                    onPressed: () {
                      setState(() {
                        selected = indexes[index].toString();
                      });
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
