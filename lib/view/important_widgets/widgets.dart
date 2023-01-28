// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'dart:developer';

import 'package:beat/back/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../../back/graphql.dart';

Widget noproduct() {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 240),
        Container(
          alignment: Alignment.center,
          child: const Icon(
            Icons.highlight_remove_sharp,
            color: Colors.black38,
            size: 60,
          ),
        ),
        const Text(
          'Нет товаров',
          style: TextStyle(color: Colors.black38),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Добавить',
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ],
    ),
  );
}

class CardPost extends StatefulWidget {
  final void Function(String) HelpDelete;
  final String id_product;
  final String productname;
  final String price;
  final String duration;
  final String bpm;
  final String keyy;
  final String genre;
  final String info;
  final String image;
  final String music;
  final String publish_date;
  const CardPost(
      {Key? key,
      required this.HelpDelete,
      required this.id_product,
      required this.productname,
      required this.price,
      required this.duration,
      required this.bpm,
      required this.keyy,
      required this.genre,
      required this.info,
      required this.image,
      required this.publish_date,
      required this.music})
      : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  Future<QueryResult> sendDeleteMut(int id_product) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(productDelete), variables: {
          'id_product': id_product,
        }),
      );

  Future<QueryResult<Object?>>? querryToSetDel;

  Future<QueryResult> sendUpdateMut(String id_product, String name, int price,
          String key, String info, String genre, String duration, int bpm) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(productUpdate), variables: {
          'id_product': id_product,
          'name': name,
          'price': price,
          'key': key,
          'info': info,
          'genre': genre,
          'duration': duration,
          'bpm': bpm
        }),
      );

  Future<QueryResult<Object?>>? querryToSetUpd;

  //контроллеры с текущими данными
  late TextEditingController nameUpdateController;
  late TextEditingController priceUpdateController;
  late TextEditingController durationUpdateController;
  late TextEditingController bpmUpdateController;
  late TextEditingController keyUpdateController;
  late TextEditingController genreUpdateController;
  late TextEditingController infoUpdateController;

  @override
  void initState() {
    nameUpdateController = TextEditingController(text: widget.productname);
    priceUpdateController = TextEditingController(text: widget.price);
    durationUpdateController = TextEditingController(text: widget.duration);
    bpmUpdateController = TextEditingController(text: widget.bpm);

    keyUpdateController = TextEditingController(text: widget.keyy);
    genreUpdateController = TextEditingController(text: widget.genre);
    infoUpdateController = TextEditingController(text: widget.info);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController nameUpdateController = TextEditingController();
    // TextEditingController priceUpdateController = TextEditingController();
    // TextEditingController durationUpdateController = TextEditingController();
    // TextEditingController bpmUpdateController = TextEditingController();
    // TextEditingController keyUpdateController = TextEditingController();
    // TextEditingController genreUpdateController = TextEditingController();
    // TextEditingController infoUpdateController = TextEditingController();
    // TextEditingController musicUpdateController = TextEditingController();
    // TextEditingController imageUpdateController = TextEditingController();
    // TextEditingController publish_dateUpdateController =
    //     TextEditingController();
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titleTextStyle: TextStyle(backgroundColor: Colors.black),
            content: SingleChildScrollView(
              child: Row(children: [
                Flexible(
                  child: Text(
                    widget.productname,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        titleTextStyle:
                            TextStyle(backgroundColor: Colors.black),
                        content: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Название',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: nameUpdateController,
                                  // focusNode: nameUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Название",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Цена',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: priceUpdateController,
                                  // focusNode: priceUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Цена",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Тональность',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: keyUpdateController,
                                  // focusNode: keyUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Тональность",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Жанр',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: genreUpdateController,
                                  // focusNode: genreUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Жанр",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Длительность',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: durationUpdateController,
                                  // focusNode: durationUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Длительность",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'УВМ',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: bpmUpdateController,
                                  // focusNode: bpmUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "УВМ",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Инфо',
                                  style: TextStyle(letterSpacing: 10),
                                ),
                                TextFormField(
                                  controller: infoUpdateController,
                                  // focusNode: infoUpdateNode,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Инфо",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (nameUpdateController.text.isEmpty ||
                                        bpmUpdateController.text.isEmpty ||
                                        durationUpdateController.text.isEmpty ||
                                        genreUpdateController.text.isEmpty ||
                                        priceUpdateController.text.isEmpty ||
                                        keyUpdateController.text.isEmpty ||
                                        infoUpdateController.text.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                          content: Text('Заполните все поля!'),
                                        ),
                                      );
                                    } else {
                                      var res =
                                          await GRaphQLProvider.client.mutate(
                                        MutationOptions(
                                            document: gql(productUpdate),
                                            variables: {
                                              'name': nameUpdateController.text
                                                  .trim(),
                                              'bpm': bpmUpdateController.text
                                                  .trim(),
                                              'duration':
                                                  durationUpdateController.text
                                                      .trim(),
                                              'genre': genreUpdateController
                                                  .text
                                                  .trim(),
                                              'price': priceUpdateController
                                                  .text
                                                  .trim(),
                                              'key': keyUpdateController.text
                                                  .trim(),
                                              'info': infoUpdateController.text
                                                  .trim(),
                                            }),
                                      );
                                      querryToSetUpd = sendUpdateMut(
                                        widget.id_product,
                                        nameUpdateController.text.trim(),
                                        int.parse(
                                            priceUpdateController.text.trim()),
                                        keyUpdateController.text.trim(),
                                        infoUpdateController.text.trim(),
                                        genreUpdateController.text.trim(),
                                        durationUpdateController.text.trim(),
                                        int.parse(
                                            bpmUpdateController.text.trim()),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromWidth(380),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: const Text("Изменить"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.square_arrow_up),
                ),
                IconButton(
                  onPressed: () async {
                    await sendDeleteMut(int.tryParse(widget.id_product) ?? 0);
                    widget.HelpDelete(widget.id_product);
                  },
                  icon: const Icon(CupertinoIcons.delete),
                ),
              ]),
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        width: 220,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      height: 50,
                      width: 50,
                      memCacheHeight: 50,
                      memCacheWidth: 50,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Flexible(
                      child: Text(
                        widget.productname + widget.publish_date,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(children: [
                Center(
                  child: Text(
                    widget.price + ' ' + 'руб.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPostforClient extends StatelessWidget {
  final String id_product;
  final String productname;
  final String price;
  final String duration;
  final String bpm;
  final String keyy;
  final String genre;
  final String info;
  final String image;
  final String music;
  final String publish_date;
  const CardPostforClient(
      {Key? key,
      required this.id_product,
      required this.productname,
      required this.price,
      required this.duration,
      required this.bpm,
      required this.keyy,
      required this.genre,
      required this.info,
      required this.image,
      required this.publish_date,
      required this.music})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<QueryResult> sendDeleteMut(int id_product) =>
        GRaphQLProvider.client.mutate(
          MutationOptions(document: gql(productDelete), variables: {
            'id_product': id_product,
          }),
        );

    sendMail() async {
      String username = 'yourname@domain.com';
      String password = 'abcdefxxxxxxx';
      String domainSmtp = 'mail.domain.com';

      final smtpServer = SmtpServer(domainSmtp,
          username: mymail, password: mymailpassword, port: 587);

      final message = Message()
        ..from = Address(username, 'Your name')
        ..recipients.add('tematerbi@mail.ru')
        ..subject = 'Dart Mailer library :: 😀 :: ${DateTime.now()}'
        ..text = 'This is the plain text.\nThis is line 2 of the text part.'
        ..html = "<h1>Shawon</h1>\n<p>Hey! Here's some HTML content</p>";

      try {
        final sendReport = await send(message, smtpServer);
        log('Message sent: ' + sendReport.toString());
      } on MailerException catch (e) {
        log('Message not sent.');
        for (var p in e.problems) {
          log('Problem: ${p.code}: ${p.msg}');
        }
      }
    }

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titleTextStyle: TextStyle(backgroundColor: Colors.black),
            content: Row(children: [
              Flexible(
                child: Text(
                  productname,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      titleTextStyle: TextStyle(backgroundColor: Colors.black),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Flexible(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Введите номер карты:',
                                    ),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [maskShopCard],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Введите CVV:',
                                  ),
                                ),
                                Flexible(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [maskCVV],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Введите срок действия карты:',
                                  ),
                                ),
                                Flexible(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [maskCardDate],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            child: Text('Купить'),
                            onPressed: () {
                              log(productname);
                              sendMail();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.money_dollar_circle),
              ),
            ]),
          ),
        );
      },
      child: Container(
        height: 100,
        width: 220,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      height: 50,
                      width: 50,
                      memCacheHeight: 50,
                      memCacheWidth: 50,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Flexible(
                      child: Text(
                        productname + publish_date,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(children: [
                Text(price + ' ' + 'руб.'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class LicenserData extends StatelessWidget {
  final String login;
  final String password;
  final String mail;
  final String info;
  final String name;
  final String surname;
  final String patronymic;
  final String passport_series;
  final String passport_number;
  const LicenserData({
    required this.login,
    required this.password,
    required this.mail,
    required this.info,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.passport_series,
    required this.passport_number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 220,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(mail)
          // Column(
          //   children: [
          //     Center(
          //       child: Text(
          //         mail,
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),
          // Column(children: [
          //   Text(name),
          // ]),
        ],
      ),
    );
  }
}

class LicensePost extends StatelessWidget {
  final String info;
  final String type;
  const LicensePost({
    Key? key,
    required this.info,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        width: 220,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              info,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              type,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class TooltipSample extends StatelessWidget {
  const TooltipSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message:
          'Введите URL-ссылку на: обложку формата .jpeg и музыку формата .mp3',
      child: Icon(Icons.info),
    );
  }
}

class TooltipSample2 extends StatelessWidget {
  const TooltipSample2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message: 'Введите URL-ссылку на музыку формата .mp3',
      child: Icon(Icons.info),
    );
  }
}

class ClientPost extends StatefulWidget {
  final void Function(String) HelpDelete;
  String id_client;
  String login;
  String password;
  String mail;
  String telephone;
  String name;
  String surname;
  String patronymic;
  String passport_series;
  String passport_number;
  ClientPost({
    Key? key,
    required this.HelpDelete,
    required this.id_client,
    required this.login,
    required this.password,
    required this.mail,
    required this.telephone,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.passport_series,
    required this.passport_number,
  }) : super(key: key);

  @override
  State<ClientPost> createState() => _ClientPostState();
}

class _ClientPostState extends State<ClientPost> {
  Future<QueryResult> sendDeleteMutClient(int id_client) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(clientDelete), variables: {
          'id_client': id_client,
        }),
      );

  Future<QueryResult<Object?>>? querryToSetDelClient;

  Future<QueryResult> sendUpdateMut(
          String id_client,
          String login,
          String password,
          String mail,
          String telephone,
          String name,
          String surname,
          String patronymic,
          String passport_series,
          String passport_number) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(clientUpdate), variables: {
          'id_client': id_client,
          'login': login,
          'password': password,
          'mail': mail,
          'telephone': telephone,
          'name': name,
          'surname': surname,
          'patronymic': patronymic,
          'passport_series': passport_series,
          'passport_number': passport_number
        }),
      );

  Future<QueryResult<Object?>>? querryToSetUpdClient;

  //контроллеры с текущими данными
  late TextEditingController loginUpdateController;
  late TextEditingController passwordUpdateController;
  late TextEditingController mailUpdateController;
  late TextEditingController telephoneUpdateController;
  late TextEditingController nameUpdateController;
  late TextEditingController surnameUpdateController;
  late TextEditingController patronymicUpdateController;
  late TextEditingController passport_seriesUpdateController;
  late TextEditingController passport_numberUpdateController;

  @override
  void initState() {
    loginUpdateController = TextEditingController(text: widget.login);
    passwordUpdateController = TextEditingController(text: widget.password);
    mailUpdateController = TextEditingController(text: widget.mail);
    telephoneUpdateController = TextEditingController(text: widget.telephone);

    nameUpdateController = TextEditingController(text: widget.name);
    surnameUpdateController = TextEditingController(text: widget.surname);
    patronymicUpdateController = TextEditingController(text: widget.patronymic);

    passport_seriesUpdateController =
        TextEditingController(text: widget.passport_series);
    passport_numberUpdateController =
        TextEditingController(text: widget.passport_number);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titleTextStyle: TextStyle(backgroundColor: Colors.black),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'ФИО: ' +
                          widget.name +
                          ' ' +
                          widget.surname +
                          ' ' +
                          widget.patronymic,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Паспортные данные: ' + widget.passport_series,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Логин: ' + widget.login,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Почта: ' + widget.mail,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Телефон: ' + widget.telephone,
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  titleTextStyle:
                                      TextStyle(backgroundColor: Colors.black),
                                  content: SingleChildScrollView(
                                    child: Center(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Логин',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller: loginUpdateController,
                                              // focusNode: nameUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Логин",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Пароль',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller:
                                                  passwordUpdateController,
                                              // focusNode: priceUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Пароль",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Почта',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller: mailUpdateController,
                                              // focusNode: keyUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Почта",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Телефон',
                                              style: TextStyle(
                                                letterSpacing: 10,
                                              ),
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  telephoneUpdateController,
                                              inputFormatters: [maskTelephone],
                                              // focusNode: genreUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Телефон",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Фамилия',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller:
                                                  surnameUpdateController,
                                              // focusNode: durationUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Фамилия",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Имя',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller: nameUpdateController,
                                              // focusNode: bpmUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Имя",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Отчество',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              controller:
                                                  patronymicUpdateController,
                                              // focusNode: infoUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Отчество",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Серия паспорта',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                maskPassportSeries
                                              ],
                                              controller:
                                                  passport_seriesUpdateController,
                                              // focusNode: infoUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Серия паспорта",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Text(
                                              'Номер паспорта',
                                              style:
                                                  TextStyle(letterSpacing: 10),
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                maskPassportNumber
                                              ],
                                              controller:
                                                  passport_numberUpdateController,
                                              // focusNode: infoUpdateNode,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Номер паспорта",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (loginUpdateController.text.isEmpty ||
                                                    passwordUpdateController
                                                        .text.isEmpty ||
                                                    mailUpdateController
                                                        .text.isEmpty ||
                                                    telephoneUpdateController
                                                        .text.isEmpty ||
                                                    surnameUpdateController
                                                        .text.isEmpty ||
                                                    nameUpdateController
                                                        .text.isEmpty ||
                                                    patronymicUpdateController
                                                        .text.isEmpty ||
                                                    passport_seriesUpdateController
                                                        .text.isEmpty ||
                                                    passport_numberUpdateController
                                                        .text.isEmpty) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        const AlertDialog(
                                                      content: Text(
                                                          'Заполните все поля!'),
                                                    ),
                                                  );
                                                } else {
                                                  var res =
                                                      await GRaphQLProvider
                                                          .client
                                                          .mutate(
                                                    MutationOptions(
                                                        document:
                                                            gql(clientUpdate),
                                                        variables: {
                                                          'login':
                                                              loginUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'password':
                                                              passwordUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'mail':
                                                              mailUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'telephone':
                                                              telephoneUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'surname':
                                                              surnameUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'name':
                                                              nameUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'patronymic':
                                                              patronymicUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'passport_series':
                                                              passport_seriesUpdateController
                                                                  .text
                                                                  .trim(),
                                                          'passport_number':
                                                              passport_numberUpdateController
                                                                  .text
                                                                  .trim(),
                                                        }),
                                                  );
                                                  querryToSetUpdClient =
                                                      sendUpdateMut(
                                                    widget.id_client,
                                                    loginUpdateController.text
                                                        .trim(),
                                                    passwordUpdateController
                                                        .text
                                                        .trim(),
                                                    mailUpdateController.text
                                                        .trim(),
                                                    telephoneUpdateController
                                                        .text
                                                        .trim(),
                                                    surnameUpdateController.text
                                                        .trim(),
                                                    nameUpdateController.text
                                                        .trim(),
                                                    patronymicUpdateController
                                                        .text
                                                        .trim(),
                                                    passport_seriesUpdateController
                                                        .text
                                                        .trim(),
                                                    passport_numberUpdateController
                                                        .text
                                                        .trim(),
                                                  );
                                                }
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.blue),
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(
                                                  const Size.fromWidth(380),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                ),
                                              ),
                                              child: const Text("Изменить"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(CupertinoIcons.square_arrow_up),
                          ),
                          IconButton(
                            onPressed: () async {
                              await sendDeleteMutClient(
                                  int.tryParse(widget.id_client) ?? 0);
                              widget.HelpDelete(widget.id_client);
                            },
                            icon: const Icon(CupertinoIcons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Container(
          height: 100,
          width: 220,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Flexible(
                        child: Text(
                          'Почта: ' + widget.mail,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'ФИО: ' +
                          widget.surname +
                          ' ' +
                          widget.name +
                          ' ' +
                          widget.patronymic,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LicensorPost extends StatefulWidget {
  final void Function(String) HelpDelete;
  String id_licensor;
  String login;
  String password;
  String mail;
  String info;
  String name;
  String surname;
  String patronymic;
  String passport_series;
  String passport_number;
  LicensorPost({
    Key? key,
    required this.HelpDelete,
    required this.id_licensor,
    required this.login,
    required this.password,
    required this.mail,
    required this.info,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.passport_series,
    required this.passport_number,
  }) : super(key: key);

  @override
  State<LicensorPost> createState() => _LicensorPostState();
}

class _LicensorPostState extends State<LicensorPost> {
  Future<QueryResult> sendDeleteMutLicensor(int id_licensor) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(licensorDelete), variables: {
          'id_licensor': id_licensor,
        }),
      );

  Future<QueryResult<Object?>>? querryToSetDelLicensor;

  Future<QueryResult> sendUpdateMut(
          String id_client,
          String login,
          String password,
          String mail,
          String info,
          String name,
          String surname,
          String patronymic,
          String passport_series,
          String passport_number) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(clientUpdate), variables: {
          'id_client': id_client,
          'login': login,
          'password': password,
          'mail': mail,
          'info': info,
          'name': name,
          'surname': surname,
          'patronymic': patronymic,
          'passport_series': passport_series,
          'passport_number': passport_number
        }),
      );

  Future<QueryResult<Object?>>? querryToSetUpdLicensor;

  //контроллеры с текущими данными
  late TextEditingController loginUpdateController;
  late TextEditingController passwordUpdateController;
  late TextEditingController mailUpdateController;
  late TextEditingController infoUpdateController;
  late TextEditingController nameUpdateController;
  late TextEditingController surnameUpdateController;
  late TextEditingController patronymicUpdateController;
  late TextEditingController passport_seriesUpdateController;
  late TextEditingController passport_numberUpdateController;

  @override
  void initState() {
    loginUpdateController = TextEditingController(text: widget.login);
    passwordUpdateController = TextEditingController(text: widget.password);
    mailUpdateController = TextEditingController(text: widget.mail);
    infoUpdateController = TextEditingController(text: widget.info);
    nameUpdateController = TextEditingController(text: widget.name);
    surnameUpdateController = TextEditingController(text: widget.surname);
    patronymicUpdateController = TextEditingController(text: widget.patronymic);
    passport_seriesUpdateController =
        TextEditingController(text: widget.passport_series);
    passport_numberUpdateController =
        TextEditingController(text: widget.passport_number);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titleTextStyle: TextStyle(backgroundColor: Colors.black),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'ФИО: ' +
                          widget.name +
                          ' ' +
                          widget.surname +
                          ' ' +
                          widget.patronymic,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Паспортные данные: ' + widget.passport_series,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Логин: ' + widget.login,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Почта: ' + widget.mail,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Информация: ' + widget.info,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              titleTextStyle:
                                  TextStyle(backgroundColor: Colors.black),
                              content: SingleChildScrollView(
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Логин',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: loginUpdateController,
                                        // focusNode: nameUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Логин",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Пароль',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: passwordUpdateController,
                                        // focusNode: priceUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Пароль",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Почта',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: mailUpdateController,
                                        // focusNode: keyUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Почта",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Инфо',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: infoUpdateController,
                                        // focusNode: genreUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Телефон",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Фамилия',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: surnameUpdateController,
                                        // focusNode: durationUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Фамилия",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Имя',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: nameUpdateController,
                                        // focusNode: bpmUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Имя",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Отчество',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller: patronymicUpdateController,
                                        // focusNode: infoUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Отчество",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Серия паспорта',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller:
                                            passport_seriesUpdateController,
                                        // focusNode: infoUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Серия паспорта",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'Номер паспорта',
                                        style: TextStyle(letterSpacing: 10),
                                      ),
                                      TextFormField(
                                        controller:
                                            passport_numberUpdateController,
                                        // focusNode: infoUpdateNode,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Номер паспорта",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (loginUpdateController
                                                  .text.isEmpty ||
                                              passwordUpdateController
                                                  .text.isEmpty ||
                                              mailUpdateController
                                                  .text.isEmpty ||
                                              infoUpdateController
                                                  .text.isEmpty ||
                                              surnameUpdateController
                                                  .text.isEmpty ||
                                              nameUpdateController
                                                  .text.isEmpty ||
                                              patronymicUpdateController
                                                  .text.isEmpty ||
                                              passport_seriesUpdateController
                                                  .text.isEmpty ||
                                              passport_numberUpdateController
                                                  .text.isEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (_) => const AlertDialog(
                                                content:
                                                    Text('Заполните все поля!'),
                                              ),
                                            );
                                          } else {
                                            var res = await GRaphQLProvider
                                                .client
                                                .mutate(
                                              MutationOptions(
                                                document: gql(licensorUpdate),
                                                variables: {
                                                  'login': loginUpdateController
                                                      .text
                                                      .trim(),
                                                  'password':
                                                      passwordUpdateController
                                                          .text
                                                          .trim(),
                                                  'mail': mailUpdateController
                                                      .text
                                                      .trim(),
                                                  'info': infoUpdateController
                                                      .text
                                                      .trim(),
                                                  'surname':
                                                      surnameUpdateController
                                                          .text
                                                          .trim(),
                                                  'name': nameUpdateController
                                                      .text
                                                      .trim(),
                                                  'patronymic':
                                                      patronymicUpdateController
                                                          .text
                                                          .trim(),
                                                  'passport_series':
                                                      passport_seriesUpdateController
                                                          .text
                                                          .trim(),
                                                  'passport_number':
                                                      passport_numberUpdateController
                                                          .text
                                                          .trim(),
                                                },
                                              ),
                                            );
                                            querryToSetUpdLicensor =
                                                sendUpdateMut(
                                              widget.id_licensor,
                                              loginUpdateController.text.trim(),
                                              passwordUpdateController.text
                                                  .trim(),
                                              mailUpdateController.text.trim(),
                                              infoUpdateController.text.trim(),
                                              surnameUpdateController.text
                                                  .trim(),
                                              nameUpdateController.text.trim(),
                                              patronymicUpdateController.text
                                                  .trim(),
                                              passport_seriesUpdateController
                                                  .text
                                                  .trim(),
                                              passport_numberUpdateController
                                                  .text
                                                  .trim(),
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                            const Size.fromWidth(380),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        child: const Text("Изменить"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.square_arrow_up),
                      ),
                      IconButton(
                        onPressed: () async {
                          await sendDeleteMutLicensor(
                              int.tryParse(widget.id_licensor) ?? 0);
                          widget.HelpDelete(widget.id_licensor);
                        },
                        icon: const Icon(CupertinoIcons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        width: 220,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Flexible(
                      child: Center(
                        child: Text(
                          'Почта: ' + widget.mail,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                    'ФИО: ' +
                        widget.surname +
                        ' ' +
                        widget.name +
                        ' ' +
                        widget.patronymic,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorRequestPostforClient extends StatelessWidget {
  final String id;
  final String send_date;
  final String info;
  // final ClientModel clientmodel;

  const ErrorRequestPostforClient({
    Key? key,
    required this.id,
    required this.send_date,
    required this.info,
    //required this.clientmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titleTextStyle: TextStyle(backgroundColor: Colors.black),
            content: SingleChildScrollView(
              child: Row(children: [
                Flexible(
                  child: Text(
                    '',
                  ),
                ),
              ]),
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        width: 220,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Flexible(
                      child: Text(
                        info,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(children: [
                Text('Дата:' + send_date.toString()),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
