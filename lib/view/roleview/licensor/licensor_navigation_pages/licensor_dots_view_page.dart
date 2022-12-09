import 'dart:math';
import 'package:beat/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dots/licensor_my_pacts_view_page.dart';
import 'dots/licensor_my_products_view_page.dart';

void main() {
  runApp(const ReviewPage());
}

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReviewPage',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const licensor_dots_view_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class licensor_dots_view_page extends StatefulWidget {
  const licensor_dots_view_page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _licensor_dots_view_pageState();
  }
}

class _licensor_dots_view_pageState extends State<licensor_dots_view_page> {
  final _controller = PageController();
  String _textdate = '';

  int currentIndex = 0;

  @override
  void initState() {
    _textdate = DateFormat.MMMMEEEEd().format(todaydate);

    _controller.addListener(() {
      onPageChange(_controller.page!);
    });
    super.initState();
  }

  String _namepageview = 'Мои товары';
  void onPageChange(double page) {
    int intPage = page.toInt();
    setState(() {
      if (page - intPage.toDouble() < 0.0001) {
        if (intPage.toDouble() == 0) {
          _namepageview = 'Мои товары';
        } else if (intPage == 1) _namepageview = 'Мои пакты';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          title: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.amber,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _namepageview,
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.brown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(
                              Icons.integration_instructions_outlined),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          shadowColor: null,
          elevation: 0.0,
          backgroundColor: color_blue,
          toolbarHeight: 70,
        ),
        backgroundColor: color_blue,
        body: Column(
          children: <Widget>[
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              dotsview(),
              Positioned(
                child: dots,
                bottom: 15,
              )
            ]),
          ],
        ));
  }

  var todaydate = DateTime.now();

  Widget dotsview() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 150,
          minHeight: 150,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.82,
        ),
        child: PageView(
          controller: _controller,
          children: const [
            licensor_my_products_view_page(),
            licensor_my_pacts_view_page(),
          ],
        ),
      ),
    );
  }

  Widget get dots {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 40,
        maxWidth: 100,
        minHeight: 20,
        maxHeight: 20,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color_blue,
        ),
        child: SmoothPageIndicator(
          controller: _controller,
          count: 2,
          effect: SwapEffect(
              activeDotColor: Colors.black,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 10),
        ),
      ),
    );
  }
}
