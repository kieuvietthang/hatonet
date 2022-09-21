// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hatonet_hcn/app/model/job.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/fake_data.dart';
import 'package:hatonet_hcn/app/view/home/dashboard/item_job.dart';
import 'package:hatonet_hcn/app/view/home/home_google_sign_in/home_google_sign_in.dart';
import 'package:hatonet_hcn/app/view/home/read_data/get_user_name.dart';
import 'package:hatonet_hcn/app/widget/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

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

  List<Job> jobs = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                      'assets/images/logo hatonet-05 (1).svg',
                      height: 55,
                      width: 250,
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Expanded(flex: 1, child: HomeGoogleSignIn()),
              ],
            ),
            SizedBox(
              height: 20,
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
                          itemCount: isLoading ? 5 : FAKE_JOB.length,
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
    );
  }

  Widget buildJob(Job job) => ListTile(
        leading: SvgPicture.asset(
          job.image,
          fit: BoxFit.fill,
          height: 30,
          width: 30,
        ),
        title: Text(
          job.name,
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            job.date,
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
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
