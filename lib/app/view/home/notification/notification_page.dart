// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/notification/fake_notification.dart';
import 'package:hatonet_hcn/app/view/home/notification/item_candidate.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Thông báo',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TabBar(
                        indicatorColor: Color(0xFFFF6116),
                        controller: tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 8),
                        tabs: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, right: 10),
                            child: Tab(
                              child: Text(
                                "Tất cả",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Chưa đọc",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          
                          padding: EdgeInsets.only(left: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Mới',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10,),
                          child: ListView.builder(
                            itemCount: FAKE_CANDIDATE.length - 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ItemCandidate(
                              item: FAKE_CANDIDATE[index],
                              onClickItem: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                       Expanded(
                         child: Column(
                           children: [
                             Expanded(
                               flex: 1,
                               child: Padding(
                                 padding: EdgeInsets.only(left: 15),
                                 child: Align(
                                   alignment: Alignment.topLeft,
                                   child: Text(
                                     'Trước đó',
                                     style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.black,
                                         fontWeight: FontWeight.normal),
                                   ),

                                 ),
                               ),
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Expanded(
                               flex: 10,
                               child: SingleChildScrollView(
                                 physics: BouncingScrollPhysics(),
                                 child: Padding(
                                   padding: EdgeInsets.only(left: 10,),
                                   child: ListView.builder(
                                     itemCount: FAKE_CANDIDATE.length,
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemBuilder: (context, index) =>Container(
                                       //height: 40,
                                       width: double.infinity,
                                       child: ItemCandidate(
                                         item: FAKE_CANDIDATE[index],
                                         onClickItem: () {},
                                       ),
                                     )
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       )
                      ],
                    ),
                    Expanded(
                      flex: 10,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,),
                          child: ListView.builder(
                              itemCount: FAKE_CANDIDATE.length - 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>Container(
                                //height: 40,
                                width: double.infinity,
                                child: ItemCandidate(
                                  item: FAKE_CANDIDATE[index],
                                  onClickItem: () {},
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
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
