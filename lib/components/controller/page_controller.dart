import 'package:chtpro/pages/homepages/channel_page.dart';
import 'package:chtpro/pages/homepages/home_page.dart';
import 'package:chtpro/pages/homepages/publication_page.dart';
import 'package:flutter/material.dart';

class PageCont extends StatefulWidget {
  const PageCont({super.key});

  @override
  State<PageCont> createState() => _PageContState();
}

class _PageContState extends State<PageCont> {
  PageController pageController = PageController();
  List<Widget> pages = [
    HomePage(),
    ChannelPage(),
    PublicationPage(),
  ];
  int selectIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffd9ffbf),
          onTap: onItemTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectIndex == 0 ? Colors.blue : Colors.grey,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group_work,
                color: selectIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: 'channel',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.publish,
                color: selectIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: 'publication',
            )
          ]),
    );
  }
}
