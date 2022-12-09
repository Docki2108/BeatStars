import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:beat/theme/colors.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test1(),
    ),
  );
}

class test1 extends StatefulWidget {
  @override
  _test1State createState() => _test1State();
}

class _test1State extends State<test1> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: SingleChildScrollView(child: Column()),
    );
  }
}
