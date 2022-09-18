// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_state.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/view/home/information_list/information_list_page.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfosBloc, InfosState>(builder: (context, state) {
      List<Info> inforsList = state.allInfos;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/icons/ic_angle_left.svg',
                          height: 24, width: 24),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                        child: Text(
                      'Danh sách thông tin',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Color(0xFFFF6116).withOpacity(0.7),
                          shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/ic_users.svg',
                          height: 14,
                          width: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InformationListPage(inforsList: inforsList),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFF6116),
                        borderRadius: BorderRadius.circular(4)),
                    height: 45,
                    width: 130,
                    child: Center(
                      child: Text(
                        'Ứng tuyển ngay',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),

        ),
      );
    });
  }
}
