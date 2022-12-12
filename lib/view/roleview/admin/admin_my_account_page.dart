// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:beat/models/roles/licensor_model.dart';
import 'package:beat/models/user_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:beat/theme/colors.dart';

import '../../../../back/constant.dart';
import '../../../../back/graphql.dart';
import '../../../../models/roles/licensor_model.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: admin_my_account_page(),
      theme: ThemeData(fontFamily: 'Roboto'),
    ),
  );
}

class admin_my_account_page extends StatefulWidget {
  @override
  _admin_my_account_pageState createState() => _admin_my_account_pageState();
}

class _admin_my_account_pageState extends State<admin_my_account_page> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_cobalt,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    UserModel().clear();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacementNamed(context, '/',
                          arguments: true);
                    });
                  },
                  color: Colors.white,
                  icon: const Icon(
                    Icons.exit_to_app_outlined,
                  ),
                )
              ],
            ),
          ],
        ),
        centerTitle: true,
        shadowColor: null,
        elevation: 0.0,
        backgroundColor: color_blue,
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          Image.asset(
            "lib/theme/images/user-file.png",
            height: 1000,
            width: 500,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          Center(
            child: Column(
              children: [
                Expanded(child: Column()),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: const Color.fromARGB(255, 124, 124, 124),
                          width: 1)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'ID: ' + UserModel().admin!.id_admin.toString(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(children: [
                            Text(
                              UserModel().admin!.login,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              UserModel().admin!.password,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Column()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
