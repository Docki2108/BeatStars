import 'package:beat/theme/colors.dart';
import 'package:beat/view/roleview/admin/admin_licensors_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'admin_clients_page.dart';

class admin_users_page extends StatefulWidget {
  const admin_users_page({super.key});

  @override
  State<admin_users_page> createState() => _admin_users_pageState();
}

class _admin_users_pageState extends State<admin_users_page> {
  final _controller = PageController();
  String _textdate = '';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onPageChange(double page) {
      int intPage = page.toInt();
      //print(page);
      setState(() {
        if (page - intPage.toDouble() < 0.0001) {
          if (intPage.toDouble() == 0) {
            _textdate = '';
          } else if (intPage == 1)
            _textdate = '';
          //_textdate = DateFormat('MM' + 'dd').format(tomorrowdate);
          else if (intPage == 2) _textdate = '';
        }
      });
    }

    @override
    void initState() {
      _textdate = '';

      _controller.addListener(() {
        onPageChange(_controller.page!);
      });
      super.initState();
    }

    return Column(
      children: <Widget>[
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          dotsview(),
          Positioned(
            child: dots,
            bottom: 15,
          )
        ]),
      ],
    );
  }

  Widget dotsview() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 150,
          minHeight: 150,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.93,
        ),
        child: PageView(
          controller: _controller,
          children: [admin_clients_page(), admin_licensors_page()],
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
