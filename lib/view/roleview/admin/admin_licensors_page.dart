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
import 'package:beat/view/important_widgets/product_add__page.dart';
import 'package:beat/view/important_widgets/widgets.dart';

import '../../../../back/constant.dart';
import '../../../../back/music/page_manager.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: admin_licensors_page(),
    ),
  );
}

class admin_licensors_page extends StatefulWidget {
  admin_licensors_page({Key? key}) : super(key: key);
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  @override
  _admin_licensors_pageState createState() => _admin_licensors_pageState();
}

class _admin_licensors_pageState extends State<admin_licensors_page> {
  List<Map<String, dynamic>> licensorsList = [];
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
                    'Лицензиары',
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
              document: gql(licensorsPost),
              fetchPolicy: FetchPolicy.networkOnly),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            log('Загрузка лицензиаров с API...');
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ]),
            );
          } else {
            log('Лицензиары найдены');
            log(dateNow);
            // log(snapshot.data.toString());
            licensorsList = (((snapshot.data as QueryResult).data
                    as Map<String, dynamic>)['licensor'] as List<Object?>)
                .cast<Map<String, dynamic>>();
            return ListView.builder(
              itemCount: licensorsList.length,
              itemBuilder: (context, i) {
                return LicensorPost(
                    HelpDelete: (id) {
                      setState(() {
                        licensorsList.removeWhere(
                            (element) => element['id_licensor'] == id);
                      });
                    },
                    id_licensor: '${licensorsList[i]['id_licensor']}',
                    login: '${licensorsList[i]['name']}',
                    password: '${licensorsList[i]['password']}',
                    mail: '${licensorsList[i]['mail']}',
                    info: '${licensorsList[i]['info']}',
                    name: '${licensorsList[i]['name']}',
                    surname: '${licensorsList[i]['surname']}',
                    patronymic: '${licensorsList[i]['patronymic']}',
                    passport_series: '${licensorsList[i]['passport_series']}',
                    passport_number: '${licensorsList[i]['passport_number']}');
              },
            );
          }
        },
      ),
    );
  }
}
