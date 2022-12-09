import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:beat/theme/colors.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test2(),
    ),
  );
}

class test2 extends StatefulWidget {
  @override
  _test2State createState() => _test2State();
}

class _test2State extends State<test2> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: SingleChildScrollView(child: Column()),
    );
  }
}
