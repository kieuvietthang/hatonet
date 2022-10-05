// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_event.dart';
import 'package:hatonet_hcn/app/model/service.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({Key? key, required this.servicesList}) : super(key: key);

  final List<Service> servicesList;

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {

  void _removeOrDeleteTask(BuildContext ctx, Service services) {
    services.isDeleted!
        ? ctx.read<ServicesBloc>().add(DeleteService(services: services))
        : ctx.read<ServicesBloc>().add(RemoveService(services: services));
  }
  bool isFavourite = false;

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
                          child: SvgPicture.asset(
                            'assets/icons/ic_highlight.svg',
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.5),
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
                        Text(
                          'VND',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
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
                          'Miễn phí đăng tin',
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
                          'hiển thị trên trang chủ',
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
                          'Hiển thị mô tả ngắn',
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
                          'Hiệu ứng nổi bật sắc màu',
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
                          'Hỗ trợ tìm kiếm đối tác',
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
                          'Email đối tác khi tạo tin',
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
                              onTap: (){
                                setState(() {
                                  isFavourite = !isFavourite;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_heart_solid.svg',
                                    height: 18,
                                    width: 18,
                                      color: isFavourite ? Colors.red : Colors.black.withOpacity(0.1),
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
