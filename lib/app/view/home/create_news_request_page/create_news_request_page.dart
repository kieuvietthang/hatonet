// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_event.dart';
import 'package:hatonet_hcn/app/blocs/job_postings_exports.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
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
  void initState() {
    applicationDeadlineController.text = "";
    super.initState();
  }

  _createNewsRequestPageState() {
    _workFormatValue = _workFormatList[0];
    _paymentTermValue = _paymentTermList[0];
    _contractTermValue = _contractTermList[0];
    _experienceValue = _experienceList[0];
    _unitPricevalue = _unitPriceList[0];
    _rankValue = _rankList[0];
    _academicLevelValue = _academicLevelList[0];
    _skillValue = _skillList[0];
    _areaValue = _areaList[0];
  }

  //Hình thức làm việc
  final _workFormatList = ['Onite', 'Remote', 'Chưa xác minh'];
  String? _workFormatValue = '';


  //Thời hạn thanh toán
  final _paymentTermList = [
    'Sau 30 ngày',
    'Sau 45 ngày',
    'Sau 60 ngày',
    'Thỏa thuận'
  ];
  String? _paymentTermValue = '';


  //Thời hạn hợp đồng

  final _contractTermList = ['1 tháng', '3 tháng', '6 tháng', ' 1 năm'];
  String _contractTermValue = '';

  //Kinh nghiệm

  final _experienceList = [
    'Dưới 1 năm',
    '2 năm',
    '3 năm',
    '4 năm',
    'từ 5 năm trở lên'
  ];

  String? _experienceValue = '';


  //Đơn giá

  final _unitPriceList = [
    '10 triệu - 20 triệu',
    '20 triệu - 30 triệu',
    '30 triệu - 40 triệu',
    '40 triệu - 50 triệu',
    '50 triệu - 80 triệu',
    'Trên 80 triệu',
  ];

  String? _unitPricevalue = '';


  //Cấp bậc

  final _rankList = ['Fresher','Middle','Junior','Senior','Architect','Mid-Lever Manager','Senior Leader'];
  String? _rankValue = '';


  //Trình độ học vấn

  final _academicLevelList = ['Không có bằng','Cao đẳng','Đại học','Cao học'];
  String? _academicLevelValue = '';

  //Kỹ năng

  final _skillList = ['PHP','NodeJS','ASP.NET','IOS','Mobile Apps', 'C++', 'Android','Laravel','Codeigniter','CakePHP','Java','Flutter','JavaScirpt'];
  String? _skillValue = '';

  //Khu vực

  final _areaList = ['Hà Nội','Hồ Chí Minh','Đà Nẵng','Đà Lạt','Cần Thơ','Vĩnh Phúc'];
  String _areaValue = '';


  TextEditingController titleController = TextEditingController();
  TextEditingController workingFormController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController applicationDeadlineController = TextEditingController();
  TextEditingController paymentTermController = TextEditingController();
  TextEditingController contractTermController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController academicLevelController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFECECEC),
          body: Form(
            key: _formKey,
            child: Column(
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Không được bỏ trống';
                                            } else
                                              null;
                                          },
                                          controller: titleController,
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsets.all(
                                                  13),
                                              hintText: 'Tiêu đề',
                                              hintStyle: TextStyle(
                                                  fontSize: 12),
                                              labelStyle: TextStyle(
                                                  fontSize: 12),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Hình thức làm việc
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _workFormatValue,
                                          items: _workFormatList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _workFormatValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Hình thức làm việc',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  //Số lượng
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Không được bỏ trống';
                                            } else
                                              null;
                                          },
                                          controller: amountController,
                                          keyboardType: TextInputType.number,
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
                                  //Hạn ứng tuyển
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Không được bỏ trống';
                                            } else
                                              null;
                                          },
                                          controller: applicationDeadlineController,
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.all(13),
                                            hintText: 'Hạn ứng tuyển',
                                            hintStyle: TextStyle(fontSize: 12),
                                            labelStyle: TextStyle(fontSize: 12),
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.calendar_month),
                                              onPressed: () async {
                                                DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                                if (pickedDate != null) {
                                                  print(
                                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                  String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                                  print(
                                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                                  //you can implement different kind of Date Format here according to your requirement

                                                  setState(() {
                                                    applicationDeadlineController
                                                        .text =
                                                        formattedDate; //set output date to TextField value.
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }
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

                                  //Thời hạn thanh toán
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _paymentTermValue,
                                          items: _paymentTermList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _paymentTermValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Thời hạn thanh toán',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Thời hạn hợp đồng
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _contractTermValue,
                                          items: _contractTermList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _contractTermValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Thời hạn hợp đồng',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                  //kinh nghiệm
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _experienceValue,
                                          items: _experienceList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _experienceValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'kinh nghiệm',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Đơn giá
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _unitPricevalue,
                                          items: _unitPriceList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _unitPricevalue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Đơn giá',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                  //Cấp bậc
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child:  DropdownButtonFormField(
                                          value: _rankValue,
                                          items: _rankList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _rankValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Cấp bậc',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Trình độ học vấn
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _academicLevelValue,
                                          items: _academicLevelList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _academicLevelValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Trình độ học vấn',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                  //Kỹ năng
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _skillValue,
                                          items: _skillList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _skillValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Kỹ năng',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Khu vực
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 10, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 2),
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            new Radius.circular(4),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          value: _areaValue,
                                          items: _areaList
                                              .map((e) =>
                                              DropdownMenuItem(
                                                child: Text(e, style: TextStyle(
                                                    fontSize: 16),),
                                                value: e,
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              _areaValue = val as String;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black.withOpacity(
                                                0.5),
                                          ),
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            hintText: 'Khu vực',
                                            enabledBorder: InputBorder.none,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
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
                                padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
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
                                padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                                child: Container(
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(4),
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
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
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          var jobPostings = JobPostings(
                            title: titleController.text,
                            applicationDeadline: applicationDeadlineController
                                .text,
                            experience: experienceController.text,
                            workingForm: _workFormatValue!,
                            academicLevel: academicLevelController.text,
                            contractTerm: _contractTermValue!,
                            unitPrice: _unitPricevalue!,
                            rank: rankController.text,
                            skill: _skillValue!,
                            amount: amountController.text,
                            paymentTerm: _paymentTermValue!,
                            area: _areaValue!,
                          );
                          context.read<JobPostingsBloc>().add(
                            AddJobPostings(
                              jobPostings: jobPostings,
                            ),
                          );
                        }
                      },
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
          ),
        ));
  }
}
