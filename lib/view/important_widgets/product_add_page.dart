// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:beat/back/constant.dart';
import 'package:beat/models/roles/licensor_model.dart';
import '../../back/graphql.dart';
import '../../models/roles/client_model.dart';
import '../../models/user_model.dart';
import '../../theme/colors.dart';
import 'widgets.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController durationController = TextEditingController();
TextEditingController bpmController = TextEditingController();
TextEditingController keyController = TextEditingController();
TextEditingController genreController = TextEditingController();
TextEditingController infoController = TextEditingController();

TextEditingController musicController = TextEditingController();
TextEditingController imageController = TextEditingController();
TextEditingController publish_dateController = TextEditingController();

late FocusNode nameNode;
late FocusNode priceNode;
late FocusNode durationNode;
late FocusNode bpmNode;
late FocusNode keyNode;
late FocusNode genreNode;
late FocusNode infoNode;

late FocusNode musicNode;
late FocusNode imageNode;
late FocusNode publish_dateNode;

class _PostPageState extends State<PostPage> {
  Future<QueryResult> sendQuerry(
          String name,
          String image,
          String music,
          int bpm,
          String duration,
          String genre,
          int price,
          String key,
          DateTime publish_date,
          String info,
          LicensorModel licensor_id) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(productInsert), variables: {
          'name': name,
          'image': image,
          'music': music,
          'bpm': bpm,
          'duration': duration,
          'genre': genre,
          'price': price,
          'key': key,
          'publish_date': publish_date,
          'info': info,
          'licensor_id': licensor_id,
        }),
      );
  Future<QueryResult<Object?>>? querryToSet;

  @override
  void initState() {
    nameNode = FocusNode();
    priceNode = FocusNode();
    durationNode = FocusNode();
    bpmNode = FocusNode();
    genreNode = FocusNode();
    infoNode = FocusNode();
    keyNode = FocusNode();
    imageNode = FocusNode();
    musicNode = FocusNode();
    publish_dateNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    nameNode.dispose();
    priceNode.dispose();
    durationNode.dispose();
    bpmNode.dispose();
    genreNode.dispose();
    infoNode.dispose();
    keyNode.dispose();
    imageNode.dispose();
    musicNode.dispose();
    publish_dateNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Добавление товара',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              dateNow,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        shadowColor: null,
        elevation: 0.0,
        backgroundColor: color_blue,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: color_blue,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        controller: nameController,
                        onEditingComplete: () => priceNode.nextFocus(),
                        focusNode: nameNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Название",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: priceController,
                        onEditingComplete: () => durationNode.nextFocus(),
                        focusNode: priceNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Цена",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        inputFormatters: [maskDuration],
                        controller: durationController,
                        onEditingComplete: () => bpmNode.nextFocus(),
                        focusNode: durationNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Длительность",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        controller: bpmController,
                        onEditingComplete: () => keyNode.nextFocus(),
                        focusNode: bpmNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "УВМ",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        controller: keyController,
                        onEditingComplete: () => genreNode.nextFocus(),
                        focusNode: keyNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Тональность",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        controller: genreController,
                        onEditingComplete: () => infoNode.nextFocus(),
                        focusNode: genreNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Жанр",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: infoController,
                            onEditingComplete: () => imageNode.nextFocus(),
                            focusNode: infoNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Дополнительная информация",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: color_blue,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.1),
                        ),
                      ),
                      child: TextFormField(
                        controller: imageController,
                        onEditingComplete: () => musicNode.nextFocus(),
                        focusNode: imageNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Картинка",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(),
                      child: TextFormField(
                        controller: musicController,
                        onEditingComplete: () => bpmNode.nextFocus(),
                        focusNode: musicNode,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Музыка",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: color_blue,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ]),
              child: ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      priceController.text.isEmpty ||
                      durationController.text.isEmpty ||
                      bpmController.text.isEmpty ||
                      keyController.text.isEmpty ||
                      genreController.text.isEmpty ||
                      infoController.text.isEmpty ||
                      musicController.text.isEmpty ||
                      imageController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        content: Text('Заполните все поля!'),
                      ),
                    );
                  } else {
                    var res = await GRaphQLProvider.client.mutate(
                      MutationOptions(document: gql(productInsert), variables: {
                        'name': nameController.text.trim(),
                        'image': imageController.text.trim(),
                        'music': musicController.text.trim(),
                        'bpm': bpmController.text.trim(),
                        'duration': durationController.text.trim(),
                        'genre': genreController.text.trim(),
                        'price': priceController.text.trim(),
                        'key': keyController.text.trim(),
                        'info': infoController.text.trim(),
                        'publish_date': DateTime.now().toString(),
                        'licensor_id': UserModel().licensor!.id_licensor,
                      }),
                    );
                    log(res.data.toString());
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushNamed(
                        context,
                        '/licensor_broadcast',
                      );
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(380),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Добавить"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
