import 'dart:developer';
import 'package:beat/back/graphql.dart';
import 'package:beat/view/important_widgets/noproduct_widget.dart';
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
      home: third_page(),
    ),
  );
}

class third_page extends StatefulWidget {
  third_page({Key? key}) : super(key: key);
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  @override
  _third_pageState createState() => _third_pageState();
}

class _third_pageState extends State<third_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: FutureBuilder(
        future: GRaphQLProvider.client
            .query(QueryOptions(document: gql(licencePost))),
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
                    //noproduct(),
                  ]),
            );
          } else {
            log('Данные найдены');
            // log(snapshot.data.toString());
            var licenseList = (((snapshot.data as QueryResult).data
                    as Map<String, dynamic>)['license'] as List<Object?>)
                .cast<Map<String, dynamic>>();
            return ListView.builder(
              itemCount: licenseList.length,
              itemBuilder: (context, i) {
                return LicensePost(
                  type: '${licenseList[i]['type']}',
                  info: '${licenseList[i]['info']}',
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('ДОБАВИТЬ'),
        icon: const Icon(CupertinoIcons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPage(),
            ),
          );
        },
      ),
    );
  }

  Widget test() {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'title',
              ),
              Text('text')
            ],
          ),
        ),
      );
    });
  }
}



// void fetchData() async {
//   setState(() {
//     _loading = true;
//   });
// }
