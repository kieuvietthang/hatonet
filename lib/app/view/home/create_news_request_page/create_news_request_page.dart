// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/view/home/job_postings_page/job_postings_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';

class createNewsRequestPage extends StatefulWidget {
  const createNewsRequestPage({Key? key}) : super(key: key);

  @override
  State<createNewsRequestPage> createState() => _createNewsRequestPageState();
}

class _createNewsRequestPageState extends State<createNewsRequestPage> {
  var selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
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
                                  child: JobPostingsPage(),
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
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tạo yêu cầu',
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
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Tiêu đề',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Hình thức làm việc',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                      suffixIcon: PopupMenuButton(
                                        onSelected: (value){
                                          setState((){
                                            selectedItem = value.toString();
                                          });
                                          print(value);
                                          Navigator.pushNamed(context, value.toString());
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/icons/ic_chevron_down.svg',
                                          height: 18,
                                          width: 18,
                                        ), itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                            child: Text('Onite'),
                                            value: 'Onite',
                                          ),
                                          PopupMenuItem(
                                            child: Text('Remote'),
                                            value: 'Remote',
                                          ),
                                          PopupMenuItem(
                                            child: Text('Chưa xác minh'),
                                            value: 'Chưa xác minh',
                                          ),

                                        ];
                                      },
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Số lượng',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Hạn ứng tuyển',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Thời hạn thanh toán',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                      suffixIcon: PopupMenuButton(
                                        onSelected: (value){
                                          setState((){
                                            selectedItem = value.toString();
                                          });
                                          print(value);
                                          Navigator.pushNamed(context, value.toString());
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/icons/ic_chevron_down.svg',
                                          height: 18,
                                          width: 18,
                                        ), itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                            child: Text('Sau 30 ngày'),
                                            value: 'Sau 30 ngày',
                                          ),
                                          PopupMenuItem(
                                            child: Text('Sau 45 ngày'),
                                            value: 'Sau 45 ngày',
                                          ),
                                          PopupMenuItem(
                                            child: Text('Sau 60 ngày'),
                                            value: 'Sau 60 ngày',
                                          ),
                                          PopupMenuItem(
                                            child: Text('Thỏa thuận'),
                                            value: 'Thỏa thuận',
                                          ),
                                        ];
                                      },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Thời hạn hợp đồng',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                      suffixIcon: PopupMenuButton(
                                        onSelected: (value){
                                          setState((){
                                            selectedItem = value.toString();
                                          });
                                          print(value);
                                          Navigator.pushNamed(context, value.toString());
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/icons/ic_chevron_down.svg',
                                          height: 18,
                                          width: 18,
                                        ), itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                            child: Text('1 tháng'),
                                            value: '1 tháng',
                                          ),
                                          PopupMenuItem(
                                            child: Text('3 tháng'),
                                            value: '3 tháng',
                                          ),
                                          PopupMenuItem(
                                            child: Text('6 tháng'),
                                            value: '6 tháng',
                                          ),
                                          PopupMenuItem(
                                            child: Text('1 năm'),
                                            value: '1 năm',
                                          ),
                                        ];
                                      },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'kinh nghiệm',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Đơn giá',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Cấp bậc',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Trình độ học vấn',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10, top: 10),
                          child: Container(
                            height: 50.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(4),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(13),
                                  hintText: 'Kỹ năng',
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10, top: 10),
                          child: Container(
                            height: 80.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(4),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(13),
                                  hintText: 'Mô tả công việc',
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10, top: 10),
                          child: Container(
                            height: 80.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(4),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(13),
                                  hintText: 'Kỹ năng yêu cầu',
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10, top: 10),
                          child: Container(
                            height: 80.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(4),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(13),
                                  hintText: 'Môi trường văn hóa',
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10,bottom: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFF6116),
                      borderRadius: BorderRadius.circular(4)),
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Tiếp tục',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
