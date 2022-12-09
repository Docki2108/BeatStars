import 'package:beat/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const licensor_my_pacts_view_page());
}

class licensor_my_pacts_view_page extends StatelessWidget {
  const licensor_my_pacts_view_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodayPage',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const MyHomePage(title: 'TodayPage'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text('Расписание',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  //DateTime now = DateTime.now();

}
