import 'package:beat/view/dots_view.dart';
import 'package:beat/view/roleview/client/client_navigation_pages/client_my_account_pages.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:beat/theme/colors.dart';
import '../../../main.dart';
import '../licensor/licensor_navigation_pages/licensor_my_activity_page.dart';
import 'client_navigation_pages/client_my_activity_page.dart';
import 'client_navigation_pages/client_products_view_page.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: client_broadcast(),
    ),
  );
}

class client_broadcast extends StatefulWidget {
  @override
  _client_broadcastState createState() => _client_broadcastState();

  @override
  void initState() {
    final _controller = PageController();

    //super.initState();
  }
}

int currentIndex = 0;
final screens = [
  client_products_view_page(),
  client_my_activity_page(),
  client_my_account_page()
];

class _client_broadcastState extends State<client_broadcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_soft_blue,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        enableFeedback: true,
        backgroundColor: color_blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 25, 81, 127),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg, color: Colors.blue),
            label: 'Товары',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_outlined, color: Colors.blue),
            label: 'лицензии*(моя деятельность)',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.blue),
              label: 'Личный кабинет',
              backgroundColor: color_soft_blue),
        ],
      ),
    );
  }

  // Widget dotsview() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: ConstrainedBox(
  //       constraints: BoxConstraints(
  //         minWidth: 150,
  //         minHeight: 150,
  //         maxWidth: MediaQuery.of(context).size.width,
  //         maxHeight: MediaQuery.of(context).size.height * 0.815,
  //       ),
  //       child: PageView(
  //         controller: _controller,
  //         children: const [TodayPage(), TomorrowPage(), DayAfterPage()],
  //       ),
  //     ),
  //   );
  // }
}
