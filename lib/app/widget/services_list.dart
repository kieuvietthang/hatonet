// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_event.dart';
import 'package:hatonet_hcn/app/model/services.dart';

class ServicesList extends StatefulWidget {

  final Services services;
  final Function editTaskCallback;

  const ServicesList({
    Key? key,
    required this.servicesList,
    required this.editTaskCallback,
    required this.services,
  }) : super(key: key);

  final List<Services> servicesList;

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {

  void _removeOrDeleteTask(BuildContext ctx, Services services) {
    services.isDeleted!
        ? ctx.read<ServicesBloc>().add(DeleteService(services: services))
        : ctx.read<ServicesBloc>().add(RemoveService(services: services));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.servicesList.length,
        itemBuilder: (context, index) {
          var services = widget.servicesList[index];
          return Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 5),
            child: Container(
              height: 270,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: GestureDetector(
                            onTap: () => widget.editTaskCallback(index),
                            child: SvgPicture.asset(
                              'assets/icons/ic_highlight.svg',
                              height: 20,
                              width: 20,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => _removeOrDeleteTask(context, services),
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                'assets/icons/ic_xmark.svg',
                                height: 20,
                                width: 20,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      services.name,
                      style: TextStyle(
                        color: Colors.red.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          services.cost,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(services.isFavorite);
                          },
                          child: Text(
                            'VND',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          services.promotional,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'VND',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_check.svg',
                          height: 16,
                          width: 16,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Mi???n ph?? ????ng tin',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_xmark.svg',
                          height: 16,
                          width: 16,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'hi???n th??? tr??n trang ch???',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_check.svg',
                          height: 16,
                          width: 16,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Hi???n th??? m?? t??? ng???n',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_xmark.svg',
                          height: 16,
                          width: 16,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Hi???u ???ng n???i b???t s???c m??u',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_check.svg',
                          height: 16,
                          width: 16,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'H??? tr??? t??m ki???m ?????i t??c',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_xmark.svg',
                          height: 16,
                          width: 16,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Email ?????i t??c khi t???o tin',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_clock_hour.svg',
                                  height: 16,
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(services.usedtime),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  services.isFavorite = !services.isFavorite;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: services.isFavorite == false
                                      ? SvgPicture.asset(
                                          'assets/icons/ic_heart_solid.svg',
                                          height: 18,
                                          width: 18,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/ic_heart_solid.svg',
                                          height: 18,
                                          width: 18,
                                          color: Colors.red,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
