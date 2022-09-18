// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/fake_data.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/item_job.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/images/logo hatonet-05 (1).svg',
              height: 55,
              width: 250,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Thống kê',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 90,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF117BBF),
                            borderRadius: BorderRadius.circular(15)),
                        height: 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '75',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Việc đăng tuyển',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_map.svg',
                                          width: 18,
                                          height: 18,
                                          color: Color(0xFF2DFE4E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF26AE60),
                            borderRadius: BorderRadius.circular(15)),
                        height: 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '75',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Việc đăng tuyển',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_map.svg',
                                          width: 18,
                                          height: 18,
                                          color: Color(0xFF2DFE4E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 90,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF363841),
                            borderRadius: BorderRadius.circular(15)),
                        height: 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '75',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Việc đăng tuyển',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_map.svg',
                                          width: 18,
                                          height: 18,
                                          color: Color(0xFF2DFE4E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFFC850),
                            borderRadius: BorderRadius.circular(15)),
                        height: 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '75',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Việc đăng tuyển',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_map.svg',
                                          width: 18,
                                          height: 18,
                                          color: Color(0xFF2DFE4E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'VIỆC ĐANG TUYỂN',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: Container(
                height: 360,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: FAKE_JOB.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            ItemJob(item: FAKE_JOB[index], onClickItem: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
