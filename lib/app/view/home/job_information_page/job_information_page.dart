// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessar sort_child_properties_last, unnecessary_new, unnecessary_this

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_state.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/home/details/details_page.dart';
import 'package:hatonet_hcn/app/view/home/job_postings_page/job_postings_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/jobPostings_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../blocs/bloc_job_postings/job_postings_bloc.dart';

class JobInformationPage extends StatefulWidget {
  final JobPostings jobPostings;

  JobInformationPage({
    Key? key,
    required this.jobPostings,
  }) : super(key: key);

  @override
  State<JobInformationPage> createState() => _JobInformationPageState();
}

class _JobInformationPageState extends State<JobInformationPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;

  //

  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  void _tabListener() {
    setState(() {
      index = tabController!.index;
    });
  }

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController!.addListener(_tabListener);
    super.initState();
  }

  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0.0,
                    pinned: true,
                    backgroundColor: Colors.white.withOpacity(0.0),
                    expandedHeight: 250.0,
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          CustomPageRoute(
                              child: JobPostingsPage(),
                              direction: AxisDirection.right),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/icons/ic_angle_left.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: top <= 10 ? 1.0 : 0.0,
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/logo_hatonet_small.png',
                                  height: 70,
                                  width: 70,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.jobPostings.title,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'C??ng ty c??? ph???n t???p ??o??n Hachinet, H?? N???i',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xff808080),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.jobPostings.skill,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/imge_hatonet_home.PNG'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.white, BlendMode.darken),
                          ),
                        ),
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.white.withOpacity(0.0)),
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/ic_download-solid.svg',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverAppBar(
                    pinned: true,
                    primary: false,
                    elevation: 8.0,
                    backgroundColor: Colors.white,
                    title: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: Color(0xFFFF6116),
                            borderRadius: BorderRadius.circular(10)),
                        indicatorColor: Color(0xFFFF6116),
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Text(
                              "Chi ti???t",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "C??ng ty",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 530.0,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: BlocBuilder<JobPostingsBloc,
                                  JobPostingsState>(builder: (context, state) {
                                List<JobPostings> jobPostingsList =
                                    state.allJobPostings;
                                return Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tuy???n d???ng',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'Th?????ng gi???i thi???u',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      '12.000.000??',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xffFF4C4C),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'Th???i h???n thanh to??n',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.paymentTerm,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'N???i dung',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'Kinh nghi???m',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.experience,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'H???c v???n',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.academicLevel,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'V??? tr??',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.workingForm,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'Lo???i c??ng vi???c',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      'Mobile Apps',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'H??nh th???c',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.workingForm,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      '????n gi??',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.unitPrice,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'S??? l?????ng',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.amount,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'H???n ???ng tuy???n',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.applicationDeadline,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
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
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                      'Th???i h???n h???p ?????ng',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      widget.jobPostings.contractTerm,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'M?? t??? c??ng vi???c',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        widget.jobPostings.jobDescription,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'K??? n??ng y??u c???u',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        widget.jobPostings.skillRequirements,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: 150,
                                      ),
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Vi???c kh??c c??ng k??? n??ng',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 450,
                                        child: JobPostingsList(
                                            jobPostingsList: jobPostingsList),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: BlocBuilder<JobPostingsBloc,
                                  JobPostingsState>(builder: (context, state) {
                                List<JobPostings> jobPostingsList =
                                    state.allJobPostings;
                                return Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'T??m vi???c l??m IT- ????ng tin tuy???n d???ng mi???n ph??_trang t??m vi???c l??m hi???u qu??? v?? uy t??n, c???p nh???t h??ng ngh??n vi???c l??m m???i m???i ng??y',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'C??ng ty:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'C??ng ty C??? ph???n Hachinet',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'L??nh v???c:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Onsite',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Quy m??:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '10 - 50 ng?????i',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Website:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'https://www.hachinet.com',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '?????a ch???:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Flexible(
                                            child: Text(
                                              'T???ng 2 t??a 21B6, chung c?? Green Stars, 234 Ph???m V??n ?????ng, H?? N???i',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Vi???c l??m c??ng C??ng ty',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 450,
                                        child: JobPostingsList(
                                            jobPostingsList: jobPostingsList),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: GestureDetector(
                        onTap: () async {},
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF6116),
                                    borderRadius: BorderRadius.circular(4)),
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'C???p nh???t',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                  border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: SvgPicture.asset('assets/icons/ic_heart-regular.svg',width: 24,height: 24,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
