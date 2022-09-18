// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController _newpassController = new TextEditingController();

  var _keyErr = 'Độ dài tối thiểu 8 - 25 ký tự bao gồm chữ và số';
  var _floralErr = 'Tối thiểu 1 ký việt HOA';
  var _especiallyErr = 'Tối thiểu 1 ký tự ĐẶC BIỆT';
  var _newpassInvalid = false;

  @override
  void initState() {
    super.initState();
  }

  bool _secureText = true;

  NewPassOnclick() {
    setState(() {
      if (_newpassController.text.length > 6 ||
          !_newpassController.text.contains('@!#/\$%^&*()')) {
        _newpassInvalid = true;
      } else {
        _newpassInvalid = false;
      }
      if (_newpassController.text.contains(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')) {
        _newpassInvalid = true;
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
                            'Thay đổi mật khẩu',
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
                    'Nhập lại mật khẩu mới',
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
                    height: 60,
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
                                  _keyErr = value;
                                  _floralErr = value;
                                  _especiallyErr = value;
                                } else {
                                  _keyErr = '';
                                  _floralErr = '';
                                  _especiallyErr = '';
                                }
                              });
                            },
                            controller: _newpassController,
                            cursorHeight: 22,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Color(0xFF565656),
                            decoration: InputDecoration(
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
                                hintText: 'Mật khẩu',
                              hintStyle: TextStyle(
                                fontSize: 18
                              )
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/ic_xmark.svg',
                          height: 20,
                          width: 20,
                          color: Color(0xFF9DA3AE),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Color(0xFF9DA3AE),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _newpassInvalid
                  ? Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(_keyErr,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.normal))),
                  )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              _newpassInvalid
                  ? Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                alignment: Alignment.topLeft,
                      child: Text(_floralErr,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.normal)),
                    ),
                  )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              _newpassInvalid
                  ? Padding(
                padding: EdgeInsets.only(left: 20),
                    child: Align(
                alignment: Alignment.topLeft,
                      child: Text(_especiallyErr,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.normal)),
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
                      if (_newpassInvalid == false) {
                        _keyErr;
                        _floralErr;
                        _especiallyErr;
                      } else {}
                      //TO DO: Logic confirm
                      NewPassOnclick();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFF6116),
                          borderRadius: BorderRadius.circular(4)),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Lưu',
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
