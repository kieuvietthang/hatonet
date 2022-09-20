// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/view/sign_in/sign_in_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';

class DetailsPage extends StatelessWidget {

  Info info;
  DetailsPage({Key? key, required this.info}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      color: Color(0xFFFF984D),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/ic_angle_left.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/images/logo_hatonet_small.png',
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,),
            //Công việc
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Công việc',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_building.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         //'Công ty cổ phần giải pháp Hachinet',
                        info.companyName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            // 'Hachinet',
                            info.abbreviations,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            // '1900',
                            info.tax,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '100-300',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_city.svg',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hà nội',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            'Chung cư Green start',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'tòa nhà 27A3',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'đường Phạm Văn Đồng',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_activity.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lĩnh vực hoạt động',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            'Product',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Outsourcing',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Solution',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Consultant',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Service',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'Human',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //Thông tin
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Thông tin',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_email.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_earth.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'https://hachinet.com',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_phone.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    // '0942389599',
                    info.hotline,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //Liên hệ cá nhân
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Liên hệ cá nhân',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_user_avatar.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Hoangth',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_email.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    // 'bboydaisy@gmail.com',
                    info.email,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_phone.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    // '0523611885',
                    info.phone,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_logout.svg',
                    height: 20,
                    width: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Hi'),
                        content: const Text('Bạn đã suy nghĩ chín chưa?'),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('tưa'),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                    child: SignInPage(
                                      showRegisterPage: () {},
                                    ),
                                    direction: AxisDirection.right),
                              );
                            },
                            child: const Text('roài'),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
