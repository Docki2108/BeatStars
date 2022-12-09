// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:beat/models/roles/licensor_model.dart';
import 'package:beat/models/user_model.dart';
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
      home: client_my_account_page(),
    ),
  );
}

class client_my_account_page extends StatefulWidget {
  @override
  _client_my_account_pageState createState() => _client_my_account_pageState();
}

class _client_my_account_pageState extends State<client_my_account_page> {
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
                  Text(UserModel().client!.login),
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
                      Navigator.pushNamed(context, '/');
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
            "lib/theme/images/manstanding.png",
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Color.fromARGB(255, 124, 124, 124), width: 1)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Почта: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                ' ',
                              ),
                              Text(
                                UserModel().client!.mail,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(children: [
                            Text(
                              UserModel().client!.surname,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              UserModel().client!.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              UserModel().client!.patronymic,
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(children: [
                            Text(
                              'Паспортные данные: ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              ' ',
                            ),
                            Text(
                              UserModel().client!.passport_series +
                                  ' ' +
                                  UserModel().client!.passport_number,
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color_blue.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            UserModel().client!.telephone,
                            style: TextStyle(color: Colors.white),
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
      // FutureBuilder(
      //   future: GRaphQLProvider.client.query(QueryOptions(
      //       document: gql(licensorInfo), variables: {'login': "licensor"})),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData || snapshot.data == null) {
      //       log('Загрузка личных данных с API...');
      //       return Center(
      //         child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Center(
      //                 child: CircularProgressIndicator(),
      //               )
      //               //noproduct(),
      //             ]),
      //       );
      //     } else {
      //       log('Данные найдены');

      //       var licensorList = (((snapshot.data as QueryResult).data
      //               as Map<String, dynamic>)['licensor'] as List<Object?>)
      //           .cast<Map<String, dynamic>>();
      //       // var aboba = licensorList
      //       //     .where((element) =>
      //       //         element['login'] == UserModel().licensor!.login)
      //       //     .toList();
      //       log("Ваши данные" + licensorList.toString());
      //       return ListView.builder(
      //         itemCount: licensorList.length,
      //         itemBuilder: (context, i) {
      //           return LicenserData(
      //               login: '${licensorList[i]['login']}',
      //               password: '${licensorList[i]['password']}',
      //               mail: '${licensorList[i]['mail']}',
      //               info: '${licensorList[i]['info']}',
      //               name: '${licensorList[i]['name']}',
      //               surname: '${licensorList[i]['surname']}',
      //               patronymic: '${licensorList[i]['patronymic']}',
      //               passport_series: '${licensorList[i]['passport_series']}',
      //               passport_number: '${licensorList[i]['passport_number']}');
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
