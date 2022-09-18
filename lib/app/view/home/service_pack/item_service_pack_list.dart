// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/service_pack.dart';

class ItemServicePackList extends StatelessWidget {
  ServicePack item;
  VoidCallback onClickItem;

  ItemServicePackList({Key? key, required this.item, required this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,

      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(2.0, 1.0))
                  ]),
              height: 70,
              width: 60,

              child: Image.asset(
                item.image,
                width: 18,
                height: 18,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,style: TextStyle(fontSize: 14,color: Color(0xFFFF6116)),),
                  SizedBox(
                    height: 3,
                  ),
                  Text(item.date,style: TextStyle(fontSize: 14,color: Color(0xFFFF6116)),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/icons/ic_triangle.svg',
              height: 16,
              width: 16,
            color: Color(0xFFFF6116),
            //  color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
