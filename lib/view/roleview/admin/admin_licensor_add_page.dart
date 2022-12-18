import 'dart:developer';

import 'package:beat/theme/colors.dart';
import 'package:beat/view/roleview/admin/admin_licensors_page.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql/client.dart';

import '../../../back/constant.dart';
import '../../../back/graphql.dart';

class admin_licensor_add_page extends StatefulWidget {
  const admin_licensor_add_page({super.key});

  @override
  State<admin_licensor_add_page> createState() =>
      _admin_licensor_add_pageState();
}

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();

TextEditingController mailController = TextEditingController();
TextEditingController infoController = TextEditingController();

TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController patronymicController = TextEditingController();
TextEditingController passport_seriesController = TextEditingController();
TextEditingController passport_numberController = TextEditingController();

late FocusNode loginNode;
late FocusNode passwordNode;
late FocusNode mailNode;
late FocusNode infoNode;
late FocusNode nameNode;
late FocusNode surnameNode;
late FocusNode patronymicNode;
late FocusNode passport_seriesNode;
late FocusNode passport_numberNode;

class _admin_licensor_add_pageState extends State<admin_licensor_add_page> {
  @override
  void initState() {
    loginNode = FocusNode();
    passwordNode = FocusNode();
    mailNode = FocusNode();
    infoNode = FocusNode();
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
    infoNode.dispose();
    nameNode.dispose();
    surnameNode.dispose();
    patronymicNode.dispose();
    passport_seriesNode.dispose();
    passport_numberNode.dispose();

    super.dispose();
  }

  void clearTextFields() {
    loginController.clear();
    passwordController.clear();
    mailController.clear();
    infoController.clear();
    nameController.clear();
    surnameController.clear();
    patronymicController.clear();
    passport_numberController.clear();
    passport_seriesController.clear();
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
                  SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Введите данные лицензиара',
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
                    height: 15,
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
                          child: TextFormField(
                            maxLength: 50,
                            controller: mailController,
                            onEditingComplete: () => surnameNode.nextFocus(),
                            focusNode: mailNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Почта",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                            onEditingComplete: () => infoNode.nextFocus(),
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
                  const SizedBox(
                    height: 15,
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
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      maxLength: 300,
                      controller: infoController,
                      focusNode: infoNode,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Информация",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
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
                onPressed: () async {
                  if (passwordController.text.isEmpty ||
                      loginController.text.isEmpty ||
                      mailController.text.isEmpty ||
                      infoController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      surnameController.text.isEmpty ||
                      patronymicController.text.isEmpty ||
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
                      MutationOptions(
                          document: gql(licensorInsert),
                          variables: {
                            'p_login': loginController.text.trim(),
                            'p_password': passwordController.text.trim(),
                            'p_mail': mailController.text.trim(),
                            'p_info': infoController.text.trim(),
                            'p_name': nameController.text.trim(),
                            'p_surname': surnameController.text.trim(),
                            'p_patronymic': patronymicController.text.trim(),
                            'p_passport_series':
                                passport_seriesController.text.trim(),
                            'p_passport_number':
                                passport_numberController.text.trim(),
                          }),
                    );
                    MaterialPageRoute(
                      builder: (context) => admin_licensors_page(),
                    );
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
                  MaterialPageRoute(
                    builder: (context) => admin_licensors_page(),
                  );
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
