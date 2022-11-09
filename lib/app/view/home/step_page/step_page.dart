// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_event.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/services/guid_gen.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class StepPage extends StatefulWidget {
  final JobPostings jobPostings;
  final Services services;

  StepPage({Key? key, required this.jobPostings, required this.services})
      : super(key: key);

  @override
  State<StepPage> createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> with SingleTickerProviderStateMixin{
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  bool closeTopContainer = false;
  int _activeStepIndex = 0;

  @override
  void initState() {
    applicationDeadlineController.text = "";
    super.initState();

    this.citys.add({'id': 1, 'name': 'Hà Nội'});
    this.citys.add({'id': 2, 'name': 'Hà Giang'});

    this.statesMasters = [
      {'ID': 1, 'Name': 'Ba Đình', 'ParentId': 1},
      {'ID': 2, 'Name': 'Hoàn Kiếm', 'ParentId': 1},
      {'ID': 3, 'Name': 'Tây Hồ', 'ParentId': 1},
      {'ID': 4, 'Name': 'Long Biên', 'ParentId': 1},
      {'ID': 5, 'Name': 'Cầu Giấy', 'ParentId': 1},
      {'ID': 6, 'Name': 'Đống Đa', 'ParentId': 1},
      {'ID': 1, 'Name': 'Đồng Văn', 'ParentId': 2},
      {'ID': 2, 'Name': 'Mèo Vạc', 'ParentId': 2},
      {'ID': 3, 'Name': 'Yên Minh', 'ParentId': 2},
      {'ID': 4, 'Name': 'Quản Bạ', 'ParentId': 2},
      {'ID': 5, 'Name': 'Vị Xuyên', 'ParentId': 2},
      {'ID': 6, 'Name': 'Bắc Mê', 'ParentId': 2},
    ];
  }

  _StepPageState() {
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

  //Tin đăng tuyển
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
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController skillRequirementsController = TextEditingController();
  TextEditingController culturalEnvironmentController = TextEditingController();

  //Thông tin liên hệ

  TextEditingController companyController = TextEditingController(text: 'Hatonet');
  TextEditingController phoneController = TextEditingController(text: '0372618714');
  TextEditingController emailController = TextEditingController(text: 'company_a@hachinet.com');
  TextEditingController cityController = TextEditingController(text: 'Hà Nội');
  TextEditingController districtController = TextEditingController(text: 'Long Biên');
  TextEditingController addressController = TextEditingController(text: 'Phạm Văn Đồng');

  List<dynamic> statesMasters = [];
  List<dynamic> states = [];
  //Tỉnh/Thành phố
  String? cityId;
  List<dynamic> citys = [];

  //Quận/Huyện
  String? stateId;

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Text('Tạo gói thành công'),
          SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            'assets/icons/ic_circle_check_solid.svg',
            height: 18,
            width: 18,
            color: Colors.green,
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),

  ];

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: Text('Tin'),
          content: Form(
            key: formKeys[0],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                           top: 10),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
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
                    SizedBox(
                      width: 5,
                    ),
                    //Hình thức làm việc
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                             top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(

                            value: _workFormatValue,
                            items: _workFormatList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 14),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
                              hintText: 'Hình thức làm việc',
                              enabledBorder: InputBorder.none,
                              // floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            top: 10),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
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
                    SizedBox(
                      width: 5,
                    ),
                    //Hạn ứng tuyển
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                           top: 10),
                        child: Container(
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
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

                            controller: applicationDeadlineController,
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 15, top: 15),
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
                            top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
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
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
                              hintText: 'Thời hạn thanh toán',
                              enabledBorder: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //Thời hạn hợp đồng
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: _contractTermValue,
                            items: _contractTermList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
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
                           top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
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
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
                              hintText: 'kinh nghiệm',
                              enabledBorder: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //Đơn giá
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                             top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: _unitPricevalue,
                            items: _unitPriceList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
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
                          top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child:DropdownButtonFormField(
                            value: _rankValue,
                            items: _rankList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
                              hintText: 'Cấp bậc',
                              enabledBorder: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //Trình độ học vấn
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                           top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: _academicLevelValue,
                            items: _academicLevelList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
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
                         top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: _skillValue,
                            items: _skillList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
                              hintText: 'Kỹ năng',
                              enabledBorder: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //Khu vực
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                         top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 50.0,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius:  BorderRadius.all(
                               Radius.circular(4),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: _areaValue,
                            items: _areaList
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e, style: TextStyle(
                                      fontSize: 12),),
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
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(
                                  13),
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
                  EdgeInsets.only( top: 10),
                  child: Container(
                    height: 80.0,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius:  BorderRadius.all(
                         Radius.circular(4),
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
                      controller: jobDescriptionController,
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
                  EdgeInsets.only( top: 10),
                  child: Container(
                    height: 80.0,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius:  BorderRadius.all(
                         Radius.circular(4),
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
                      controller: skillRequirementsController,
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
                  EdgeInsets.only( top: 10),
                  child: Container(
                    height: 80.0,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius:  BorderRadius.all(
                         Radius.circular(4),
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
                      controller: culturalEnvironmentController,
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
          )
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: Text('thông tin'),
          content: Form(
            key: formKeys[1],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      color: Color(0xFFFFC700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Thông tin',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //Tên liên hệ
                Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 5, top: 10),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
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
                      controller: companyController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(
                              13),
                          hintText: 'Tên liên hệ',
                          hintStyle: TextStyle(
                              fontSize: 12),
                          labelStyle: TextStyle(
                              fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                //Số điện thoại
                Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 5, top: 10),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
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
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(
                              13),
                          hintText: 'Số điện thoại',
                          hintStyle: TextStyle(
                              fontSize: 12),
                          labelStyle: TextStyle(
                              fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                //Email
                Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 5, top: 10),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
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
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(
                              13),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 12),
                          labelStyle: TextStyle(
                              fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                // Tỉnh/thành phố
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FormHelper.dropDownWidget(
                    context,
                    'Tỉnh/Thành phố',
                    this.cityId,
                    this.citys,
                        (onChangedVal) {
                      this.cityId = onChangedVal;
                      print('Selected Country: $onChangedVal');
                      this.states = this
                          .statesMasters
                          .where(
                            (stateItem) =>
                        stateItem['ParentId']
                            .toString() ==
                            onChangedVal.toString(),
                      )
                          .toList();
                      this.stateId = null;
                      setState(() {

                      });

                    },
                        (onValidateVal) {
                      if (onValidateVal == null) {
                        return 'Không được bỏ trống';
                      }
                      return null;
                    },
                    focusedBorderWidth: 1,
                    borderWidth: 0,
                    paddingRight: 5,
                    paddingLeft: 5,
                    borderColor: Theme.of(context).primaryColor,
                    borderFocusColor: Colors.black,
                    borderRadius: 4,
                    // optionValue: 'val',
                    // optionLabel: 'name',
                  ),
                ),
                // Quận/Huyện
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    child: FormHelper.dropDownWidget(
                      context,
                      'Quận/Huyện',
                      this.stateId,
                      this.states,
                          (onChangedVal) {
                        this.stateId = onChangedVal;
                        print('Selected State: $onChangedVal');

                      },
                          (onValidate) {
                        return null;
                      },
                      focusedBorderWidth: 1,
                      borderWidth: 0,
                      paddingRight: 5,
                      paddingLeft: 5,
                      borderColor:
                      Theme.of(context).primaryColor,
                      borderFocusColor: Colors.black,
                      borderRadius: 4,
                      optionValue: 'ID',
                      optionLabel: 'Name',
                    ),
                  ),
                ),
                //Địa chỉ chi tiết
                Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 5, top: 10),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
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
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(
                              13),
                          hintText: 'Địa chỉ chi tiết',
                          hintStyle: TextStyle(
                              fontSize: 12),
                          labelStyle: TextStyle(
                              fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: StepState.editing,
          isActive: _activeStepIndex >= 2,
          title: Text('Gói dịch vụ'),
          content: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: Builder(builder: (context) {
              final Size size = MediaQuery.of(context).size;
              final double categoryHeight = size.height * 0.30;
              return Column(
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: size.width,
                      alignment: Alignment.topCenter,
                      height: closeTopContainer ? 0 : categoryHeight,
                      child: categoriesScroller),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nhập mã Khuyến mãi nếu có',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 150),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(13),
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text(
                        'Lưu',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Color(0xFF4fa203),
                      textColor: Colors.white,
                      onPressed: () {

                        if (formKeys[_activeStepIndex].currentState?.validate() ?? true) {
                          var jobPostings = JobPostings(
                            title: titleController.text,
                            applicationDeadline: applicationDeadlineController
                                .text,
                            experience: _experienceValue ?? '',
                            workingForm: _workFormatValue ?? '',
                            academicLevel: _academicLevelValue ?? '',
                            contractTerm: _contractTermValue,
                            unitPrice: _unitPricevalue ?? '',
                            rank: rankController.text,
                            skill: _skillValue ?? '',
                            amount: amountController.text,
                            paymentTerm: _paymentTermValue ?? '',
                            area: _areaValue,
                            jobDescription: jobDescriptionController.text,
                            skillRequirements: skillRequirementsController.text,
                            culturalEnvironment: culturalEnvironmentController.text,
                            id: GUIDGen.generate(),
                            isFavorite: false,
                          );
                          context.read<JobPostingsBloc>().add(
                            AddJobPostings(
                              jobPostings: jobPostings,
                            ),
                          );
                          print(jobPostings.workingForm);
                          showSnackbar(context);
                        }
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6116),
          actions: [],
        ),
        backgroundColor: Colors.white,
        body: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Color(0xFFFF6116),
                  background: Colors.red,
                  secondary: Color(0xFFFF6116),
                ),
          ),
          child: Stepper(
            controlsBuilder: (context, _) {
              return Row(
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFFFF6116),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if(!formKeys[_activeStepIndex].currentState!.validate()){
                          return;
                        }
                        if (_activeStepIndex < (stepList().length - 1)) {
                          _activeStepIndex += 1;
                        }
                        setState(() {
                          //
                        });
                      },
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_activeStepIndex == 0) {
                        return;
                      }
                      _activeStepIndex -= 1;
                      setState(() {
                        //
                      });
                    },
                    child: Text(
                      'Quay lại',
                      style: TextStyle(
                        color: Color(0xFFFF6116),
                      ),
                    ),
                  ),
                ],
              );
            },
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                _activeStepIndex += 1;
              }
              setState(() {
                //
              });
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }
              _activeStepIndex -= 1;
              setState(() {
                //
              });
            },
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller();

  @override
  State<CategoriesScroller> createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  bool _basic = false;
  bool _premium = false;
  bool _vip = false;

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.50 - 100;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _basic = !_basic;
                  });
                },
                child: Container(
                  width: 250,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    border: _basic
                        ? Border.all(color: Color(0xFFFF6116), width: 3)
                        : Border.all(color: Colors.white),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'BASIC',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1.000.000 VND",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "0 VND",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Miễn phí đăng tin",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_xmark.svg',
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hiển thị trên trang chủ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_xmark.svg',
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hiển thị mô tả ngắn",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_xmark.svg',
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "hiểu ứng nổi bật sắc màu",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_xmark.svg',
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hỗ trợ tìm kiếm đối tác",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_xmark.svg',
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Email đối tác khi tạo tin",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _premium = !_premium;
                  });
                },
                child: Container(
                  width: 250,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: _premium
                        ? Border.all(color: Color(0xFFFF6116), width: 3)
                        : Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'PREMIUM',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "5.000.000 VND",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3.000.000 VND",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_xmark.svg',
                                height: 16,
                                width: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Miễn phí đăng tin",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_correct.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Hiển thị trên trang chủ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_correct.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Hiển thị mô tả ngắn",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_xmark.svg',
                                height: 16,
                                width: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "hiểu ứng nổi bật sắc màu",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_xmark.svg',
                                height: 16,
                                width: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Hỗ trợ tìm kiếm đối tác",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_correct.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Email đối tác khi tạo tin",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _vip = !_vip;
                  });
                },
                child: Container(
                  width: 250,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    border: _vip
                        ? Border.all(color: Color(0xFFFF6116), width: 3)
                        : Border.all(color: Colors.white),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'VIP',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "10.000.000 VND",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "5.000.000 VND",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Miễn phí đăng tin",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hiển thị trên trang chủ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hiển thị mô tả ngắn",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "hiểu ứng nổi bật sắc màu",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/ic_correct.svg',
                                height: 16, width: 16),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hỗ trợ tìm kiếm đối tác",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_correct.svg',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Email đối tác khi tạo tin",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
