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
import 'package:beat/view/important_widgets/product_add_page.dart';
import 'package:beat/view/important_widgets/widgets.dart';

import '../../../../back/constant.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: admin_products_view_page(),
    ),
  );
}

class admin_products_view_page extends StatefulWidget {
  admin_products_view_page({Key? key}) : super(key: key);
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  @override
  _admin_products_view_pageState createState() =>
      _admin_products_view_pageState();
}

class _admin_products_view_pageState extends State<admin_products_view_page> {
  List<Map<String, dynamic>> productList = [];
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
                    'Товары',
                  ),
                ],
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
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
              document: gql(productPost), fetchPolicy: FetchPolicy.networkOnly),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            log('Загрузка товаров с API...');
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
            log('Товары найдены');
            log(dateNow);
            // log(snapshot.data.toString());
            productList = (((snapshot.data as QueryResult).data
                    as Map<String, dynamic>)['product'] as List<Object?>)
                .cast<Map<String, dynamic>>();
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, i) {
                return CardPost(
                  HelpDelete: (id) {
                    setState(() {
                      productList.removeWhere(
                          (element) => element['id_product'] == id);
                    });
                  },
                  id_product: '${productList[i]['id_product']}',
                  productname: '${productList[i]['name']}',
                  price: '${productList[i]['price']}',
                  duration: '${productList[i]['duration']}',
                  bpm: '${productList[i]['bpm']}',
                  keyy: '${productList[i]['key']}',
                  genre: '${productList[i]['genre']}',
                  info: '${productList[i]['info']}',
                  image: '${productList[i]['image']}',
                  publish_date: '${productList[i]['publish_date']}',
                  music: '${productList[i]['music']}',
                );
              },
            );
          }
        },
      ),
    );
  }
}
