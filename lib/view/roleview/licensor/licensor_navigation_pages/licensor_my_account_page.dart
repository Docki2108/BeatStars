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
import '../../../important_widgets/widgets.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myaccount(),
      theme: ThemeData(fontFamily: 'Roboto'),
    ),
  );
}

class myaccount extends StatefulWidget {
  @override
  _myaccountState createState() => _myaccountState();
}

class _myaccountState extends State<myaccount> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_soft_blue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(UserModel().licensor!.login),
                ],
              ),
            ]),
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
            "lib/theme/images/businessman-working-on-laptop2.png",
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
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                'Почта: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const Text(
                                ' ',
                              ),
                              Text(
                                UserModel().licensor!.mail,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
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
                              UserModel().licensor!.surname,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              UserModel().licensor!.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              UserModel().licensor!.patronymic,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ]),
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
                            const Text(
                              'Паспортные данные: ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const Text(
                              ' ',
                            ),
                            Text(
                              UserModel().licensor!.passport_series +
                                  ' ' +
                                  UserModel().licensor!.passport_number,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ]),
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
                          child: Text(
                            UserModel().licensor!.info,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
