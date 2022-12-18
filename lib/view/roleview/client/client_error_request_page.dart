import 'dart:developer';
import 'package:beat/back/graphql.dart';
import 'package:beat/view/important_widgets/product_add_page.dart';
import 'package:beat/view/important_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:beat/theme/colors.dart';
import '../../../../back/constant.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: client_error_request__page(),
    ),
  );
}

class client_error_request__page extends StatefulWidget {
  client_error_request__page({Key? key}) : super(key: key);
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  @override
  _client_error_request__pageState createState() =>
      _client_error_request__pageState();
}

class _client_error_request__pageState
    extends State<client_error_request__page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: FutureBuilder(
        future: GRaphQLProvider.client
            .query(QueryOptions(document: gql(errorRequestView))),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            log('Загрузка данных с API...');
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
            log('Данные найдены');
            var errorRequestList = (((snapshot.data as QueryResult).data
                    as Map<String, dynamic>)['error_request'] as List<Object?>)
                .cast<Map<String, dynamic>>();
            return ListView.builder(
              itemCount: errorRequestList.length,
              itemBuilder: (context, i) {
                return ErrorRequestPostforClient(
                  id: '${errorRequestList[i]['id']}',
                  send_date: '${errorRequestList[i]['send_date']}',
                  info: '${errorRequestList[i]['info']}',
                );
              },
            );
          }
        },
      ),
    );
  }
}
