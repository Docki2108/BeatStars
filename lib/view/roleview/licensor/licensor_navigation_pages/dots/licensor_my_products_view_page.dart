import 'package:beat/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql/client.dart';

import '../../../../../back/constant.dart';
import '../../../../../back/graphql.dart';
import '../../../../../models/user_model.dart';
import '../../../../important_widgets/widgets.dart';

void main() {
  runApp(const licensor_my_products_view_page());
}

class licensor_my_products_view_page extends StatelessWidget {
  const licensor_my_products_view_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodayPage',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const MyHomePage(title: 'TodayPage'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: Stack(
        children: [
          FutureBuilder(
            future: GRaphQLProvider.client
                .query(QueryOptions(document: gql(myProductView))),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
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
                // log(snapshot.data.toString());
                // var productList = (((snapshot.data as QueryResult).data
                //     as Map<String, dynamic>)['product'] as List<Object?>)
                // .cast<Map<String, dynamic>>();
                // var aboba = productList
                // .where((element) =>
                //     element['login'] == UserModel().licensor!.login)
                // .toList();
                var productList = (((snapshot.data as QueryResult).data
                        as Map<String, dynamic>)['product'] as List<Object?>)
                    .cast<Map<String, dynamic>>();
                return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, i) {
                    return CardPost(
                      HelpDelete: (id) {
                        setState(() {
                          productList
                              .removeWhere((element) => element['id_product']);
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
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 650,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.add_circled_solid,
                      size: 35, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
