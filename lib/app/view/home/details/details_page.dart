// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/services/firebase_auth_methods.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/sign_in/sign_in_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  Function onClick;
  Info info;

  DetailsPage({Key? key, required this.info, required this.onClick}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('user')
        .orderBy('age', descending: false)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }
  Future<void> signOut() async {
      await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
      return SignInPage(showRegisterPage: (){});
    }), (route) => false);
    prefs.clear();
    Get.offAll(SignInPage(showRegisterPage: (){}));
  }

  bool isEmailVerified = false;

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? BottomBarPage()
      : SafeArea(
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
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                    child: BottomBarPage(),
                                    direction: AxisDirection.right),
                              );
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
                  height: 25,
                ),
                //C??ng vi???c
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
                      'C??ng vi???c',
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
                            //'C??ng ty c??? ph???n gi???i ph??p Hachinet',
                            widget.info.companyName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                // 'Hachinet',
                                widget.info.abbreviations,
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
                                widget.info.tax,
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
                            'H?? n???i',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                'Chung c?? Green start',
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
                                't??a nh?? 27A3',
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
                                '???????ng Ph???m V??n ?????ng',
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
                            'L??nh v???c ho???t ?????ng',
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

                //Th??ng tin
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
                      'Th??ng tin',
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
                        widget.info.hotline,
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

                //Li??n h??? c?? nh??n
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
                      'Li??n h??? c?? nh??n',
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
                        widget.info.email,
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
                        widget.info.phone,
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
                      GestureDetector(
                        onTap: () => showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                                    title: const Text('Hi'),
                                content: const Text('B???n ?????ng ?? tho??t ?'),
                                actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                       onPressed: () {
                                         Navigator.pop(context);
                                },
                                      child: const Text('tr??? l???i',style: TextStyle(fontWeight: FontWeight.normal),),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: ()async{
                                  Navigator.pop(context);
                                await signOut();

                                },
                                child: const Text('?????ng ??',style: TextStyle(fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                        ),
                        child: Text(
                          '????ng xu???t',
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
