// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/services_list.dart';

class DeleteHistoryPack extends StatelessWidget {
  const DeleteHistoryPack({Key? key}) : super(key: key);

  static const id = 'favorite_pack_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: (){
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
                    SizedBox(
                      width: 15,
                    ),
                    Chip(
                      label: Text(
                        'Lịch sử xóa',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Spacer(),
                      Container(
                        height: 30,
                        width: 30,

                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: SvgPicture.asset(
                                'assets/icons/ic_trash_solid.svg',
                                height: 22,
                                width: 22,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue
                                ),
                                child: Center(
                                  child: Text(
                                    '${state.removedServices.length}',
                                    style: TextStyle(fontSize: 16,color: Colors.white),
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
              ServicesList(servicesList: state.removedServices, editTaskCallback: () {  },)
            ],
          ),
        ),
      );
    });
  }
}
