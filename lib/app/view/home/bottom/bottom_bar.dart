// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/view/home/home/home_page.dart';
import 'package:hatonet_hcn/app/view/home/job/job_page.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/skill_list_data_job/list_job_page.dart';
import 'package:hatonet_hcn/app/view/home/notification/notification_page.dart';
import 'package:hatonet_hcn/app/widget/navigation_drawer_widget.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  var _currentIndex = 0;
  int index = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
   // ListJobPage(),
   // JobPage(),
    ListJobPage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
            _currentIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    bool onSelected = true;

    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          currentIndex: _currentIndex,
          backgroundColor: Color(0xFFF9FAFB),
          selectedItemColor: Color(0xFFE65C00),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                width: 24,
                color: Color(0xFFE65C00),
              ),
              //   backgroundColor: Color(0xFFE65C00),
              label: "Trang ch???",
              icon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_work.svg',
                width: 24,
                color: Color(0xFFE65C00),
              ),
              icon: SvgPicture.asset(
                'assets/icons/ic_work.svg',
                width: 24,
              ),
              label: "Vi???c l??m",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_bells.svg',
                width: 24,
                color: Color(0xFFE65C00),
              ),
              icon: SvgPicture.asset(
                'assets/icons/ic_bells.svg',
                width: 24,
              ),
              label: "Th??ng b??o",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_bars.svg',
                width: 24,
                color: Color(0xFFE65C00),
              ),
              icon: SvgPicture.asset(
                'assets/icons/ic_bars.svg',
                width: 20,
              ),
              label: "Kh??c",
            ),
          ],
        ),
        body: _widgetOptions[_currentIndex],
      ),
    );
  }
}
