import 'dart:developer';
import 'dart:typed_data';
import 'package:beat/models/roles/client_model.dart';
import 'package:beat/models/roles/licensor_model.dart';
import 'package:beat/models/roles/operator_model.dart';
import 'package:beat/view/roleview/admin/admin_review_page.dart';
import 'package:beat/view/roleview/licensor/licensor_broadcast.dart';
import 'package:beat/back/graphql.dart';
import 'package:beat/view/roleview/client/client_broadcast.dart';
import 'package:beat/view/roleview/operator/operator_broadcast.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:beat/theme/colors.dart';
import 'back/constant.dart';
import 'models/roles/admin_model.dart';
import 'models/user_model.dart';
import 'view/roleview/admin/admin_broadcast.dart';
import 'view/startpages/client_registration_page.dart';
import 'view/startpages/licensor_registration_page.dart';
import 'view/startpages/registration_page.dart';

Future<void> main() async => {
      await Supabase.initialize(url: SUPABASE_LINK, anonKey: SUPABASE_ANONKEY),
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/licensor_broadcast': (context) => licensor_broadcast(),
            '/client_broadcast': (context) => client_broadcast(),
            '/operator_broadcast': (context) => operator_broadcast(),
            '/admin_broadcast': (context) => admin_broadcast(),
            //
            '/registration': (context) => RegistrationPage(),
            '/client_registration': (context) => ClientRegistrationPage(),
            '/licensor_registration': (context) => LicensorRegistrationPage(),
            //
            '/admin_users': (context) => admin_review_page(),
          },
          theme: ThemeData(fontFamily: 'RobotoMono'),
        ),
      )
    };

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

late final Paint foreground;
var p = Paint();
late FocusNode loginNode;
late FocusNode passwordNode;

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _HomePageState extends State<HomePage> {
  Future<QueryResult> auth(String login, String password) =>
      GRaphQLProvider.client.mutate(MutationOptions(
          document: gql(authMutation),
          variables: {'p_login': login, 'p_password': password},
          fetchPolicy: FetchPolicy.networkOnly));

  Future<QueryResult<Object?>>? querryToSet;
  HasuraConnect hasuraConnect = HasuraConnect(GRAPHQL_LINK);

  final _loginformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    loginNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  void clearText() {
    loginController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: color_blue,
                    blurRadius: 100,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              child: const Center(
                child: Image(
                  image: AssetImage("lib/theme/images/music-app.png"),
                  height: 375,
                  width: 375,
                ),
                // Lottie.asset(
                //     'lib/theme/animation/lf30_editor_8qq45nl0.json'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Text(
                          'BeatStars',
                          style: TextStyle(
                              fontSize: 70,
                              fontFamily: 'RobotoMono',
                              color: Colors.white),
                        ),
                        // Text(
                        //   'хххх смешно ххх',
                        //   style: TextStyle(
                        //     fontSize: 40,
                        //     foreground: Paint()
                        //       ..style = PaintingStyle.stroke
                        //       ..strokeWidth = 100
                        //       ..color = Colors.blue[700]!,
                        //   ),
                        // ),
                        // const Text(
                        //   'Авторизация',
                        //   style: TextStyle(
                        //     fontSize: 40,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        // const Text(
                        //   'Авторизация',
                        //   style: TextStyle(
                        //     fontSize: 40,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
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
                            key: _loginformKey,
                            controller: loginController,
                            onEditingComplete: () => passwordNode.nextFocus(),
                            focusNode: loginNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Логин",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'RobotoMono',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            key: _passwordformKey,
                            controller: passwordController,
                            focusNode: passwordNode,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Пароль",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: color_blue,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: color_blue,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: FutureBuilder(
                        future: querryToSet,
                        builder: (context, snapshot) {
                          log(querryToSet.toString());
                          if (snapshot.hasData) {
                            log('Авторизация...');
                            var authdata = (snapshot.data as QueryResult).data;
                            if (authdata!.entries.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text('Пользователь не найден!'),
                                      const Text('Повторите попытку...'),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              var entry = authdata.entries.firstWhere(
                                (element) =>
                                    element.key != '__typename' &&
                                    (element.value["login"] != null),
                              );
                              if (entry.key == 'error') {
                              } else {
                                switch (entry.key) {
                                  case "adminlogin":
                                    var adminData =
                                        entry.value as Map<String, dynamic>;
                                    UserModel(
                                      admin: AdminModel.fromMap(adminData),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacementNamed(
                                          context, '/admin_broadcast');
                                    });
                                    clearText();
                                    break;
                                  case "clientlogin":
                                    var clientData =
                                        entry.value as Map<String, dynamic>;
                                    UserModel(
                                      client: ClientModel.fromMap(clientData),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacementNamed(
                                          context, '/client_broadcast');
                                    });
                                    clearText();
                                    break;
                                  case "operatorlogin":
                                    var operatorData =
                                        entry.value as Map<String, dynamic>;
                                    UserModel(
                                      operator:
                                          OperatorModel.fromMap(operatorData),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacementNamed(
                                          context, '/operator_broadcast');
                                    });
                                    clearText();
                                    break;
                                  case "licensorlogin":
                                    var licensorData =
                                        entry.value as Map<String, dynamic>;
                                    UserModel(
                                      licensor:
                                          LicensorModel.fromMap(licensorData),
                                    );

                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacementNamed(
                                          context, '/licensor_broadcast');
                                    });
                                    clearText();
                                    break;
                                  default:
                                    Future.delayed(
                                      Duration.zero,
                                      () => showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                          content: Text('ошибка'),
                                        ),
                                      ),
                                    );
                                }
                              }
                            }
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if (passwordController.text.isEmpty ||
                                  loginController.text.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (_) => const AlertDialog(
                                    content: Text('Заполните все поля!'),
                                  ),
                                );
                              } else {
                                setState(() {
                                  querryToSet = auth(
                                      loginController.text.trim(),
                                      passwordController.text.trim());
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
                            child: const Text("Продолжить"),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushNamed(context, '/registration');
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          color: color_blue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
