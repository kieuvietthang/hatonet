// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/favorite_services_list.dart';

class FavoritePage extends StatelessWidget {
  final Services services;
  const FavoritePage({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context,state) {
        List<Services> servicesList = state.allServices;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
              height: 60,
              width: double.infinity,
              color: Color(0xFFEEF5F5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Danh s??ch y??u th??ch',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
                FavoriteServicesList(servicesList: servicesList,)
              ],
            ),
          ),
        );
      }
    );
  }
}
