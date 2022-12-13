import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:beat/back/graphql.dart';
import 'package:beat/theme/colors.dart';
import 'package:beat/view/important_widgets/noproduct_widget.dart';
import 'package:beat/view/important_widgets/product_add_page.dart';
import 'package:beat/view/important_widgets/widgets.dart';

import '../../../../back/constant.dart';
import '../../../../back/music/page_manager.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: admin_clients_page(),
    ),
  );
}

class admin_clients_page extends StatefulWidget {
  admin_clients_page({Key? key}) : super(key: key);
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  @override
  _admin_clients_pageState createState() => _admin_clients_pageState();
}

class _admin_clients_pageState extends State<admin_clients_page> {
  List<Map<String, dynamic>> clientsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Клиенты',
                  ),
                ],
              ),
            ]),
          ],
        ),
        centerTitle: true,
        shadowColor: null,
        elevation: 0.0,
        backgroundColor: color_blue,
        toolbarHeight: 70,
      ),
      backgroundColor: color_cobalt,
      body: FutureBuilder(
        future: GRaphQLProvider.client.query(
          QueryOptions(
              document: gql(clientsPost), fetchPolicy: FetchPolicy.networkOnly),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            log('Загрузка клиентов с API...');
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                    //noproduct(),
                  ]),
            );
          } else {
            log('Клиенты найдены');
            log(dateNow);
            // log(snapshot.data.toString());
            clientsList = (((snapshot.data as QueryResult).data
                    as Map<String, dynamic>)['client'] as List<Object?>)
                .cast<Map<String, dynamic>>();
            return ListView.builder(
              itemCount: clientsList.length,
              itemBuilder: (context, i) {
                return ClientPost(
                    HelpDelete: (id) {
                      setState(() {
                        clientsList.removeWhere(
                            (element) => element['id_product'] == id);
                      });
                    },
                    id_client: '${clientsList[i]['id_client']}',
                    login: '${clientsList[i]['name']}',
                    password: '${clientsList[i]['password']}',
                    mail: '${clientsList[i]['mail']}',
                    telephone: '${clientsList[i]['telephone']}',
                    name: '${clientsList[i]['name']}',
                    surname: '${clientsList[i]['surname']}',
                    patronymic: '${clientsList[i]['patronymic']}',
                    passport_series: '${clientsList[i]['passport_series']}',
                    passport_number: '${clientsList[i]['passport_number']}');
              },
            );
          }
        },
      ),
    );
  }
}
