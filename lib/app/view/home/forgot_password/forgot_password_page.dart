// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/view/home/forgot_password/new_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = new TextEditingController();

  var _emailErr = 'Không được bỏ trống email';
  var _emailInvalid = false;

  @override
  void initState() {
    super.initState();
  }

  EmailOnclick() {
    setState(() {
      if (_emailController.text.length >= 6 ||
          !_emailController.text.contains('@')) {
        _emailInvalid = true;
      } else {
        _emailInvalid = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFFFCFCFE),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Quên mật khẩu',
                            style: TextStyle(
                                color: Color(
                                  0xFF121826,
                                ),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/ic_xmark.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF6116),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tìm tài khoản của bạn',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF121826),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF6C727F),
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3)),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                if (value.contains(' ')) {
                                  _emailErr = value;
                                } else {
                                  _emailErr = '';
                                }
                              });
                            },
                            controller: _emailController,
                            cursorHeight: 25,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Color(0xFF565656),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: SvgPicture.asset(
                                  'assets/icons/ic_xmark.svg',
                                  height: 22,
                                  width: 22,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _emailInvalid
                  ? Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_xmark.svg',
                            height: 18,
                            width: 18,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(_emailErr,
                                style: TextStyle(
                                    color: Color(0xFF121826),
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: GestureDetector(
                    onTap: () {
                      if (_emailInvalid == false) {
                        _emailErr;
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPasswordPage()));
                      }
                      EmailOnclick();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFF6116),
                          borderRadius: BorderRadius.circular(4)),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Tiếp tục',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
