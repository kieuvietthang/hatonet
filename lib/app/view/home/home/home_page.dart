// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/model/job.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_hcn/app/utils/next_screen.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/fake_data.dart';
import 'package:hatonet_hcn/app/view/home/home_google_sign_in/home_google_sign_in.dart';
import 'package:hatonet_hcn/app/view/sign_in/sign_in_page.dart';
import 'package:hatonet_hcn/app/widget/shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  @override
  void initState() {
    getDocId();
    super.initState();
    loadData();
    getData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2), () {});
    jobs = List.of(FAKE_JOB);

    setState(() {
      isLoading = false;
    });
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

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  List<Job> jobs = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    return BlocBuilder<ServicesBloc, ServicesState>(builder: (context, state) {
      List<Services> servicesList = state.allServices;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          '',
                          height: 55,
                          width: 250,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    // Expanded(flex: 1, child: HomeGoogleSignIn()),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () async{
                          await sp.userSignOut();
                           nextScreenReplace(
                              context, SignInPage(showRegisterPage: () {}));
                        },
                        child: SvgPicture.asset(
                          'assets/icons/ic_right_from_bracket.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Thống kê',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
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
                                borderRadius: BorderRadius.circular(4)),
                            height: 80,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 15),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '${state.allServices.length}',
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
                                              'assets/icons/ic_briefcase.svg',
                                              width: 18,
                                              height: 18,
                                              color: Colors.white,
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
                                borderRadius: BorderRadius.circular(4)),
                            height: 80,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 15),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '0',
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
                                          'Ứng tuyển vào',
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
                                              'assets/icons/ic_user_plus.svg',
                                              width: 18,
                                              height: 18,
                                              color: Colors.white,
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
                                borderRadius: BorderRadius.circular(4)),
                            height: 80,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 15),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '0',
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
                                          'việc đã lưu',
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
                                              'assets/icons/ic_bookmark.svg',
                                              width: 18,
                                              height: 18,
                                              color: Colors.white,
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
                                borderRadius: BorderRadius.circular(4)),
                            height: 80,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 15),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '0',
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
                                          'Đã trúng tuyển',
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
                                              'assets/icons/ic_user_check.svg',
                                              width: 18,
                                              height: 18,
                                              color: Colors.white,
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
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: FAKE_JOB.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (isLoading) {
                                  return buildFoodShimmer();
                                } else {
                                  final job = FAKE_JOB[index];

                                  return buildJob(job);
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildJob(Job job) => Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              job.image,
              fit: BoxFit.fill,
              height: 50,
              width: 50,
            ),
            title: Text(
              job.name,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                job.date,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Divider(),
          // Container(
          //   height: 1,
          //   color: Color(0xFFD9D0D0),
          // )
        ],
      );

  Widget buildFoodShimmer() => ListTile(
        leading: ShimmerWidget.circular(
          width: 64,
          height: 64,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        title: ShimmerWidget.rectangular(height: 16),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: ShimmerWidget.rectangular(
              height: 14,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
      );
}
