// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class ItemServicePack extends StatefulWidget {
  final String name;
  final String pirce;
  final String number;
  final String image;

  ItemServicePack(
      {Key? key,
      required this.name,
      required this.pirce,
      required this.number,
      required this.image})
      : super(key: key);

  @override
  State<ItemServicePack> createState() => _ItemServicePackState();
}

class _ItemServicePackState extends State<ItemServicePack> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final styte = TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

    return Padding(
      padding: EdgeInsets.only(left: 100, right: 100, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(2.0, 1.0))
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.pirce,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.pirce,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.image,
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.number,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.image,
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.number,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.image,
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.number,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.image,
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.number,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  OpenServiceDetails(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF2FB344),
                      borderRadius: BorderRadius.circular(4)),
                  height: 35,
                  width: 150,
                  child: Center(
                    child: Text(
                      'Đăng kí ngay',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OpenServiceDetails(BuildContext context) => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Chi tiết dịch vụ')),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chi tết gói',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Loại gói Basic',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Thời hạn sử dụng: 30 ngày',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Giá tiền: 5.000.000đ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Giá khuyến mãi: 4.499.000đ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Thông tin người mua',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Tên công ty: Công ty A',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Địa chỉ: Phạm Văn đồng',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Số điện thoại: 0372618714',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(1)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 1, vertical: 1),
                    child: Container(
                      height: 40,
                      width: 100,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),backgroundColor: Color(0xFFD9D3D3),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                         'Quay lại',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00BE41),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(1)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 1, vertical: 1),
                    child: Container(
                      height: 40,
                      width: 150,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),backgroundColor: Color(0xFFD9D3D3),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Thanh toán VNPAY',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00BE41),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      );
}
