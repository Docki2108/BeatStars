import 'package:beat/view/dots_view.dart';
import 'package:beat/view/roleview/licensor/licensor_navigation_pages/licensor_dots_view_page.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:beat/theme/colors.dart';
import '../../../main.dart';
import '../../important_widgets/product_add__page.dart';
import 'licensor_navigation_pages/licensor_my_account_page.dart';
import 'licensor_navigation_pages/licensor_products_view_page.dart';
import 'licensor_navigation_pages/licensor_my_activity_page.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: licensor_broadcast(),
    ),
  );
}

class licensor_broadcast extends StatefulWidget {
  @override
  _licensor_broadcastState createState() => _licensor_broadcastState();

  @override
  void initState() {
    final _controller = PageController();

    //super.initState();
  }
}

int currentIndex = 0;
final screens = [products_view_page(), licensor_dots_view_page(), myaccount()];
final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = products_view_page();

class _licensor_broadcastState extends State<licensor_broadcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPage(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = products_view_page();
                        currentIndex = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wysiwyg,
                          color: currentIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Товары',
                          style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = products_view_page();
                        currentIndex = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Мои товары',
                          style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = products_view_page();
                        currentIndex = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = myaccount();
                        currentIndex = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_box,
                          color: currentIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Мой аккаунт',
                          style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// class _licensor_broadcastState extends State<licensor_broadcast> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: color_soft_blue,
//       body: screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 32,
//         enableFeedback: true,
//         backgroundColor: color_blue,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Color.fromARGB(255, 25, 81, 127),
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.wysiwyg, color: Colors.blue),
//             label: 'Товары',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.table_rows_outlined, color: Colors.blue),
//             label: 'Моя деятельность',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_box, color: Colors.blue),
//               label: 'Личный кабинет',
//               backgroundColor: color_soft_blue),
//         ],
//       ),
//     );
//   }

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
