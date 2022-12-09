import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoProduct extends StatelessWidget {
  const NoProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 240),
        Icon(
          CupertinoIcons.square_stack_3d_up_slash,
          color: Colors.black38,
          size: 60,
        ),
        SizedBox(height: 10),
        Text(
          'Нет товаров',
          style: TextStyle(color: Colors.grey),
        ),
        CupertinoButton(
          onPressed: () {},
          child: Text(
            '+ Добавить',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
