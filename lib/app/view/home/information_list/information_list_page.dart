// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_event.dart';
import 'package:hatonet_hcn/app/model/info.dart';


class InformationListPage extends StatelessWidget {
  final List<Info> inforsList;

  const InformationListPage({Key? key, required this.inforsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: ListView.builder(
        itemCount: inforsList.length,
        itemBuilder: (context, index) {
          var info = inforsList[index];
          return Container(
            child: SingleChildScrollView(
              child: ListTile(
                title: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Color(0xFFD9D9D9)
                                        : Color(0xFFFF7331),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_user_solid.svg',
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.black.withOpacity(0.1),
                            padding: EdgeInsets.only(left: 5,top: 3),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vị trí ứng tuyển: Fresher',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        info.name,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '........',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_angle_right_solid.svg',
                                    height: 16,
                                    width: 16,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onLongPress: ()=>context.read<InfosBloc>().add(DeleteInfo(info: info)),
              ),
            ),
          );
        }),
      ),
    );
  }
}
