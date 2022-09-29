// ignore_for_file: prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/model/service.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/home/create_package/create_package.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/services_list.dart';

class CreateServicePack extends StatefulWidget {
  const CreateServicePack({Key? key}) : super(key: key);

  @override
  State<CreateServicePack> createState() => _CreateServicePackState();
}

class _CreateServicePackState extends State<CreateServicePack> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Animation? _colorTween;


  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(_animationController!);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        List<Service> servicesList = state.allServices;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.only(top: 20, left: 20,right: 20),
              child: Column(
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
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nhanh chóng - hiệu quả',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'NỀN TẢNG KẾT NỐI NHÂN SỰ ONSITE SỐ 1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomPageRoute(
                              child: CreatePackage(),
                              direction: AxisDirection.left),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color(0xFFEA530A),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                      child: const Text(
                        '+ Tạo gói dịch vụ',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ServicesList(servicesList: servicesList),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
