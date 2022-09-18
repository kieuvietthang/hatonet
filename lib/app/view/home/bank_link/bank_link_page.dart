// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BankLinkPage extends StatefulWidget {



  BankLinkPage({Key? key}) : super(key: key);

  @override
  State<BankLinkPage> createState() => _BankLinkPageState();
}

class _BankLinkPageState extends State<BankLinkPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.black.withOpacity(0.2),
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_angle_left.svg',
                                    height: 24,
                                    width: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Liên kết ngân hàng',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(13),
                            labelText: 'Tên ngân hàng',
                            labelStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(13),
                            labelText: 'Tên chủ thẻ',
                            labelStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(13),
                            labelText: 'Số tài khoản',
                            labelStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(13),
                            labelText: 'Ngày phát hành',
                            labelStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(13),
                            labelText: 'Chi nhánh ngân hàng',
                            labelStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5))),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,right: 10
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6116),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: 45,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Cập nhật',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
