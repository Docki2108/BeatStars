import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OperatorPage extends StatefulWidget {
  const OperatorPage({super.key});

  @override
  State<OperatorPage> createState() => _OperatorPageState();
}

class _OperatorPageState extends State<OperatorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('оператор'),
      ),
    );
  }
}
