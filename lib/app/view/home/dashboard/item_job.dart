// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/job.dart';

class ItemJob extends StatelessWidget {
  Job item;
  VoidCallback onClickItem;

  ItemJob({Key? key, required this.item, required this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Container(
        width: double.infinity,
        height: 80,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 80,
                width: 80,
                color: Color(0xFFEFEBEB),
                child: SvgPicture.asset(
                  item.image,
                  fit: BoxFit.fill,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      item.date,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(

                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFF2D36FE),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
