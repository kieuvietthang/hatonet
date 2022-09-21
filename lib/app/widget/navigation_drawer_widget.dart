// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/view/home/accountt/account_pagee.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/dashboard_page.dart';
import 'package:hatonet_hcn/app/view/home/details/details_page.dart';
import 'package:hatonet_hcn/app/view/home/service_pack/service_pack_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  String? _selectedValue1;
  String? _selectedVlaue2;
  final List<String> _Job1 = ["Tin đăng tuyển", "Đã ứng tuyển", "Đã lưu"];
  final List<String> _Job2 = ["Danh sách của tôi", "Đã ứng tuyển"];

  //đổi màu Dashboard
  bool _hasBeenDashboard = false;
  bool _hasBeenTextDashboard = false;

  //đổi màu việc đang tuyển
  bool _hasBeenJob = false;
  bool _hasBeenTextJob = false;

  //Gói dịch vụ
  bool _hasBeenServicePack = false;
  bool _hasBeenTextServicePack = false;

  //Account
  bool _hasBeenAccount = false;
  bool _hasBeenTextAccount = false;

  //Ý kiến khách hàng
  bool _hasBeencustomer = false;
  bool _hasBeenTextcustomer = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFF1F1F1F),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/logo hatonet-07 (2).png',
                height: 70,
                width: 220,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'TỔNG QUAN',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding:EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor: _hasBeenDashboard ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),
                ),
                onPressed: () {
                  setState(() {
                    _hasBeenDashboard = !_hasBeenDashboard;
                    _hasBeenTextDashboard = !_hasBeenTextDashboard;
                  });
                  Navigator.of(context).push(
                    CustomPageRoute(
                        child: DashBoardPage(), direction: AxisDirection.left),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_grid_add.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.8),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                            color: _hasBeenTextDashboard
                                ? Colors.white.withOpacity(0.8)
                                : Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor: _hasBeenJob ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),
                ),
                onPressed: () {
                  setState(() {
                    _hasBeenJob = !_hasBeenJob;
                    _hasBeenTextJob = !_hasBeenTextJob;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_list.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.3),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Việc đang tuyển',
                        style: TextStyle(
                            color: _hasBeenTextJob
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPagee()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'QUẢN LÝ CÔNG VIỆC',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      'assets/icons/ic_assignment.svg',
                      width: 18,
                      height: 18,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Quản lý việc làm',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PopupMenu(
                        menulist: const [
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Đã ứng tuyển'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Đã lưu'),
                            ),
                          ),
                        ],
                        icon: SvgPicture.asset(
                          'assets/icons/ic_chevron_down.svg',
                          color: Colors.white.withOpacity(0.3),
                          height: 18,
                          width: 18,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      'assets/icons/ic_users.svg',
                      width: 18,
                      height: 18,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Hồ sơ ứng viên',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PopupMenu(
                        menulist: const [
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Danh sách của tôi'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Đã ứng tuyển'),
                            ),
                          ),
                        ],
                        icon: SvgPicture.asset(
                          'assets/icons/ic_chevron_down.svg',
                          color: Colors.white.withOpacity(0.3),
                          height: 18,
                          width: 18,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'CÀI ĐẶT',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Gói dịch vụ
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor:_hasBeenServicePack ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),
                ),
                onPressed: () {
                  setState(() {
                    _hasBeenServicePack = !_hasBeenServicePack;
                    _hasBeenTextServicePack = !_hasBeenTextServicePack;
                  });

                  Navigator.of(context).push(
                    CustomPageRoute(
                        child: ServicePackPage(),
                        direction: AxisDirection.down),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_package.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.3),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Gói dịch vụ',
                        style: TextStyle(
                            color: _hasBeenTextServicePack
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //Tài khoản
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor: _hasBeenAccount ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),
                ),
                onPressed: () {
                  setState(() {
                    _hasBeenAccount = !_hasBeenAccount;
                    _hasBeenTextAccount = !_hasBeenTextAccount;
                  });

                  Navigator.of(context).push(
                    CustomPageRoute(
                        child: AccountPagee(), direction: AxisDirection.down),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_users.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.3),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Tài Khoản',
                        style: TextStyle(
                            color: _hasBeenTextAccount
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor: _hasBeencustomer ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),),
                onPressed: () {
                  setState(() {
                    _hasBeencustomer = !_hasBeencustomer;
                    _hasBeenTextcustomer = !_hasBeenTextcustomer;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_message.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.3),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Ý kiến khách hàng',
                        style: TextStyle(
                            color: _hasBeenTextcustomer
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),backgroundColor:  _hasBeencustomer ? Color(0xFFFF6116).withOpacity(0.5) : Color(0xFF1F1F1F),
                ),
                onPressed: () {
                  setState(() {
                    _hasBeencustomer = !_hasBeencustomer;
                    _hasBeenTextcustomer = !_hasBeenTextcustomer;
                  });

                  // setState(() {
                  //   _hasBeencustomer = !_hasBeencustomer;
                  //   _hasBeenTextcustomer = !_hasBeenTextcustomer;
                  // });
                  Navigator.of(context).push(
                    CustomPageRoute(
                        child:  DetailsPage(
                          info: Info(
                              tax: '',
                              email: '',
                              password: '',
                              hotline: '',
                              abbreviations: '',
                              phone: '',
                              companyName: ''),
                        ), direction: AxisDirection.left),
                  );

                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_users.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.3),
                        )),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Thông tin chi tiết',
                        style: TextStyle(
                            color: _hasBeenTextcustomer
                                ? Colors.white.withOpacity(0.3)
                                : Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupMenu extends StatelessWidget {
  final List<PopupMenuEntry> menulist;
  final Widget? icon;

  const PopupMenu({Key? key, required this.menulist, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      itemBuilder: ((context) => menulist),
      icon: icon,
    );
  }
}
