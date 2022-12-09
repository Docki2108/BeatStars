import 'dart:developer';

import 'package:beat/theme/colors.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/colors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

const String _imageUrl = "lib/theme/images/businessman-working-on-laptop.png";

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      color: color_soft_blue,
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushNamed(
                                context, '/client_registration');
                          });
                        },
                        child: Image.asset("lib/theme/images/manstanding.png",
                            height: 1000,
                            width: 500,
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 1,
                            strokeAlign: StrokeAlign.center,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Text(
                          'КЛИЕНТ',
                          style: new TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                            letterSpacing: 5.0,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                blurRadius: 12.0,
                                color: color_soft_blue,
                                offset: Offset(3.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: InkWell(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, '/licensor_registration');
                      });
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          "lib/theme/images/businessman-working-on-laptop2.png",
                          height: 1000,
                          width: 500,
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Text(
                              'ЛИЦЕНЗИАР',
                              style: new TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.blue,
                                letterSpacing: 5.0,
                                fontSize: 20,
                                shadows: [
                                  Shadow(
                                    blurRadius: 12.0,
                                    color: color_soft_blue,
                                    offset: Offset(3.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 700, 0, 0),
          //     child: ElevatedButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all<Color>(color_blue),
          //         fixedSize: MaterialStateProperty.all<Size>(
          //           Size.fromWidth(380),
          //         ),
          //         shape: MaterialStateProperty.all(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(16),
          //           ),
          //         ),
          //       ),
          //       child: const Text(
          //         "Продолжить",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 800, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, '/');
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(color_blue),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(380),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text(
                  "Назад",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
