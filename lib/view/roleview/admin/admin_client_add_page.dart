// ignore_for_file: non_constant_identifier_names

import 'package:ferry/typed_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql/client.dart';

import 'package:beat/back/constant.dart';
import 'package:beat/theme/colors.dart';

import '../../../back/graphql.dart';

class admin_client_add_page extends StatefulWidget {
  const admin_client_add_page({super.key});

  @override
  State<admin_client_add_page> createState() => _admin_client_add_pageState();
}

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();

TextEditingController mailController = TextEditingController();
TextEditingController telephoneController = TextEditingController();

TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController patronymicController = TextEditingController();
TextEditingController passport_seriesController = TextEditingController();
TextEditingController passport_numberController = TextEditingController();

void clearTextFields() {
  loginController.clear();
  passwordController.clear();
  mailController.clear();
  telephoneController.clear();
  nameController.clear();
  surnameController.clear();
  patronymicController.clear();
  passport_numberController.clear();
  passport_seriesController.clear();
}

late FocusNode loginNode;
late FocusNode passwordNode;
late FocusNode mailNode;
late FocusNode telephoneNode;
late FocusNode nameNode;
late FocusNode surnameNode;
late FocusNode patronymicNode;
late FocusNode passport_seriesNode;
late FocusNode passport_numberNode;

class _admin_client_add_pageState extends State<admin_client_add_page> {
  Future<QueryResult> sendMutation(
    String login,
    String password,
    String mail,
    String telephone,
    String name,
    String surname,
    String patronymic,
    String passport_series,
    String passport_number,
  ) =>
      GRaphQLProvider.client.mutate(
        MutationOptions(document: gql(clientInsert), variables: {
          'p_login': login,
          'p_password': password,
          'p_mail': mail,
          'p_telephone': telephone,
          'p_name': name,
          'p_surname': surname,
          'p_patronymic': patronymic,
          'p_passport_series': passport_series,
          'p_passport_number': passport_number,
        }),
      );
  Future<QueryResult<Object?>>? mutationToSet;

  @override
  void initState() {
    loginNode = FocusNode();
    passwordNode = FocusNode();
    mailNode = FocusNode();
    telephoneNode = FocusNode();
    nameNode = FocusNode();
    surnameNode = FocusNode();
    patronymicNode = FocusNode();
    passport_seriesNode = FocusNode();
    passport_numberNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    loginNode.dispose();
    passwordNode.dispose();
    mailNode.dispose();
    telephoneNode.dispose();
    nameNode.dispose();
    surnameNode.dispose();
    patronymicNode.dispose();
    passport_seriesNode.dispose();
    passport_numberNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Введите данные клиента',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
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
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 30,
                            controller: loginController,
                            onEditingComplete: () => passwordNode.nextFocus(),
                            focusNode: loginNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Логин",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            maxLength: 50,
                            controller: passwordController,
                            onEditingComplete: () => mailNode.nextFocus(),
                            focusNode: passwordNode,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Пароль",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 50,
                            controller: mailController,
                            onEditingComplete: () => telephoneNode.nextFocus(),
                            focusNode: mailNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Почта",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskTelephone],
                            controller: telephoneController,
                            onEditingComplete: () => surnameNode.nextFocus(),
                            focusNode: telephoneNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "+7(XXX)XXX-XX-XX",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 50,
                            controller: surnameController,
                            onEditingComplete: () => nameNode.nextFocus(),
                            focusNode: surnameNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Фамилия",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 50,
                            controller: nameController,
                            onEditingComplete: () => patronymicNode.nextFocus(),
                            focusNode: nameNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Имя",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            maxLength: 50,
                            controller: patronymicController,
                            onEditingComplete: () =>
                                passport_seriesNode.nextFocus(),
                            focusNode: patronymicNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Отчество",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.1),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskPassportSeries],
                            controller: passport_seriesController,
                            onEditingComplete: () =>
                                passport_numberNode.nextFocus(),
                            focusNode: passport_seriesNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Серия паспорта",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskPassportNumber],
                            controller: passport_numberController,
                            focusNode: passport_numberNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Номер паспорта",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                  if (passwordController.text.isEmpty ||
                      loginController.text.isEmpty ||
                      mailController.text.isEmpty ||
                      telephoneController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      surnameController.text.isEmpty ||
                      passport_numberController.text.isEmpty ||
                      passport_seriesController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        content: Text('Заполните все поля!'),
                      ),
                    );
                  } else {
                    await GRaphQLProvider.client.mutate(
                      MutationOptions(document: gql(clientInsert), variables: {
                        'p_login': loginController.text.trim(),
                        'p_password': passwordController.text.trim(),
                        'p_mail': mailController.text.trim(),
                        'p_telephone': telephoneController.text.trim(),
                        'p_name': nameController.text.trim(),
                        'p_surname': surnameController.text.trim(),
                        'p_patronymic': patronymicController.text.trim(),
                        'p_passport_series':
                            passport_seriesController.text.trim(),
                        'p_passport_number':
                            passport_numberController.text.trim(),
                      }),
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushNamed(context, '/');
                    });
                    clearTextFields();
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(380),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Продолжить"),
              ),
            ),
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
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, '/registration');
                  });
                  clearTextFields();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(380),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Назад"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
