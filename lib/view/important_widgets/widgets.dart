// Widget productlisttile() {
//   return Column(
//     children: [
//       CupertinoButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => Container(
//               color: Colors.amber,
//               child: Text('qwe qwe qwe'),
//             ),
//           );
//         },
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   height: 90,
//                   width: 90,
//                   decoration: const BoxDecoration(
//                     color: Colors.blueGrey,
//                     //borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'sss sd s ds sd sd sdsd sd sd s',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         'udoqwdd dddddd ddddd dddd dd d ddddddd ddddddddddd ddddddd dddddddddddddddddddddddddddddd qcw qw',
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(color: Colors.blueGrey),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       Container(
//         height: 0.1,
//         color: Colors.black87,
//       ),
//     ],
//   );
// }
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:beat/back/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:just_audio/just_audio.dart';
import '../../back/graphql.dart';
import '../../back/music/page_manager.dart';

// late FocusNode nameUpdateNode;
// late FocusNode priceUpdateNode;
// late FocusNode durationUpdateNode;
// late FocusNode bpmUpdateNode;
// late FocusNode keyUpdateNode;
// late FocusNode genreUpdateNode;
// late FocusNode infoUpdateNode;

//useless
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

class CardPost extends StatelessWidget {
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
    TextEditingController nameUpdateController =
        TextEditingController(text: productname);
    TextEditingController priceUpdateController =
        TextEditingController(text: price);
    TextEditingController durationUpdateController =
        TextEditingController(text: duration);
    TextEditingController bpmUpdateController =
        TextEditingController(text: bpm);
    TextEditingController keyUpdateController =
        TextEditingController(text: keyy);
    TextEditingController genreUpdateController =
        TextEditingController(text: genre);
    TextEditingController infoUpdateController =
        TextEditingController(text: info);

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
                      content: Center(
                        child: Container(
                          child: Column(
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
                              //TODO
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
                                            'bpm':
                                                bpmUpdateController.text.trim(),
                                            'duration': durationUpdateController
                                                .text
                                                .trim(),
                                            'genre': genreUpdateController.text
                                                .trim(),
                                            'price': priceUpdateController.text
                                                .trim(),
                                            'key':
                                                keyUpdateController.text.trim(),
                                            'info': infoUpdateController.text
                                                .trim(),
                                          }),
                                    );
                                    querryToSetUpd = sendUpdateMut(
                                      id_product,
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
                                child: const Text("Добавить"),
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
                onPressed: () {
                  querryToSetDel = sendDeleteMut(int.tryParse(id_product) ?? 0);
                },
                icon: const Icon(CupertinoIcons.delete),
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

// //useless
// class LicensorPost extends StatelessWidget {
//   final String productname;
//   final String price;
//   final String duration;
//   final String bpm;
//   final String keyy;
//   final String genre;
//   final String info;
//   final String image;
//   final String music;
//   const LicensorPost(
//       {Key? key,
//       required this.productname,
//       required this.price,
//       required this.duration,
//       required this.bpm,
//       required this.keyy,
//       required this.genre,
//       required this.info,
//       required this.image,
//       required this.music})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 220,
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.black12,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Text(
//             productname,
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(price),
//         ],
//       ),
//     );
//   }
// }

// late final PageManager _pageManager;
// @override
// void initState() {
//   super.initState();
//   _pageManager = PageManager();
// }

// @override
// void dispose() {
//   _pageManager.dispose();
//   super.dispose();
// }

// Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 const Spacer(),
//                 ValueListenableBuilder<ProgressBarState>(
//                   valueListenable: _pageManager.progressNotifier,
//                   builder: (_, value, __) {
//                     return ProgressBar(
//                       progress: value.current,
//                       buffered: value.buffered,
//                       total: value.total,
//                       onSeek: _pageManager.seek,
//                     );
//                   },
//                 ),
//                 ValueListenableBuilder<ButtonState>(
//                   valueListenable: _pageManager.buttonNotifier,
//                   builder: (_, value, __) {
//                     switch (value) {
//                       case ButtonState.loading:
//                         return Container(
//                           margin: const EdgeInsets.all(8.0),
//                           width: 32.0,
//                           height: 32.0,
//                           child: const CircularProgressIndicator(),
//                         );
//                       case ButtonState.paused:
//                         return IconButton(
//                           icon: const Icon(Icons.play_arrow),
//                           iconSize: 32.0,
//                           onPressed: _pageManager.play,
//                         );
//                       case ButtonState.playing:
//                         return IconButton(
//                           icon: const Icon(Icons.pause),
//                           iconSize: 32.0,
//                           onPressed: _pageManager.pause,
//                         );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),