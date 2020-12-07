import 'package:education_app/pages/guide_page.dart';
import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小学教育',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: GuidePage(),
      home: EntryPage(),
    );
  }
}

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: GuidePage(
              goFn: () {
                Navigator.of(context).pop();
              },
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabNavigator();
  }
}
