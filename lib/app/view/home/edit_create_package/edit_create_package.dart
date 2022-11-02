// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_event.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/services/guid_gen.dart';
import 'package:hatonet_hcn/app/view/home/create_service_pack/create_service_pack.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:intl/intl.dart';

class EditCreatePackage extends StatefulWidget {
  final Services oldServices;
    int index;

   EditCreatePackage({Key? key, required this.oldServices, required this.index}) : super(key: key);

  @override
  State<EditCreatePackage> createState() => _EditCreatePackageState();
}

class _EditCreatePackageState extends State<EditCreatePackage> {

  bool isChecked = false;
  bool isCheckeds = false;

  TextEditingController dateinputstartday = TextEditingController();
  TextEditingController dateinputenddate = TextEditingController();
  TextEditingController dateinputusedtime = TextEditingController();


  @override
  void initState() {
    dateinputstartday.text = ""; //set the initial value of text field
    dateinputenddate.text = ""; //set the initial value of text field
    super.initState();

    nameController = TextEditingController(text: widget.oldServices.name);
    describeController = TextEditingController(text: widget.oldServices.describe);
    statusController = TextEditingController(text: widget.oldServices.status);
    supportController = TextEditingController(text: widget.oldServices.support);
    costController = TextEditingController(text: widget.oldServices.cost);
    promotionalController = TextEditingController(text: widget.oldServices.promotional);
  }

  TextEditingController nameController =
  TextEditingController();
  TextEditingController describeController =
  TextEditingController();
  TextEditingController statusController =
  TextEditingController();
  TextEditingController supportController =
  TextEditingController();
  TextEditingController costController =
  TextEditingController();
  TextEditingController promotionalController =
  TextEditingController();



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

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    final _formKey = GlobalKey<FormState>();


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nhanh chóng - hiệu quả',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'NỀN TẢNG KẾT NỐI NHÂN SỰ ONSITE SỐ 1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 1.0))
                            ],
                          ),
                          height: 350,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
                                    autofocus: true,
                                    controller: nameController,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF6116), width: 2),
                                        ),
                                        //   errorText: _emailInvalid ? _emailErr : null,
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Tên gói',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFF6116),
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
                                    autofocus: true,
                                    controller: describeController,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF6116), width: 2),
                                        ),
                                        //   errorText: _emailInvalid ? _emailErr : null,
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Mô tả',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFF6116),
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
                                    controller: statusController,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF6116), width: 2),
                                        ),
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Trạng thái',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFF6116),
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Gói khuyên dùng',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: dateinputstartday,
                                    readOnly: true,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFF6116), width: 2),
                                      ),
                                      contentPadding: EdgeInsets.all(13),
                                      labelText: 'Ngày bắt đầu',
                                      labelStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFFF6116),
                                          fontWeight: FontWeight.w300),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_month),
                                        onPressed: () async {
                                          DateTime? pickedDate = await showDatePicker(
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
                                              dateinputstartday.text =
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
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: dateinputenddate,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFF6116), width: 2),
                                      ),
                                      contentPadding: EdgeInsets.all(13),
                                      labelText: 'Ngày kết thúc',
                                      labelStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFFF6116),
                                          fontWeight: FontWeight.w300),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_month),
                                        onPressed: () async {
                                          DateTime? pickedDate = await showDatePicker(
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
                                              dateinputenddate.text =
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 1.0))
                            ],
                          ),
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    RawMaterialButton(
                                      highlightElevation: 5,
                                      splashColor: Color(0xFFEA530A),
                                      onPressed: () {},
                                      fillColor: Colors.white,
                                      child: Icon(
                                        Icons.add,
                                        size: 15.0,
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: isCheckeds,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckeds = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Hỗ trợ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: TextFormField(
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: 'Tên Công ty',
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFFF6116),
                                          fontWeight: FontWeight.w300),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFF6116), width: 2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 1.0))
                            ],
                          ),
                          height: 200,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
                                    controller: costController,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF6116), width: 2),
                                        ),
                                        //   errorText: _emailInvalid ? _emailErr : null,
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Giá gốc',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFF6116),
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Không được bỏ trống';
                                      } else
                                        null;
                                    },
                                    controller: promotionalController,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF6116), width: 2),
                                        ),
                                        //   errorText: _emailInvalid ? _emailErr : null,
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Giá khuyến mãi',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFF6116),
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: dateinputusedtime,
                                    cursorColor: Color(0xFFFF6116),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFF6116), width: 2),
                                      ),
                                      contentPadding: EdgeInsets.all(13),
                                      labelText: 'Thời gian sử dụng',
                                      labelStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFFF6116),
                                          fontWeight: FontWeight.w300),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_month),
                                        onPressed: () async {
                                          DateTime? pickedDate = await showDatePicker(
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
                                              dateinputusedtime.text =
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFEA530A),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var editservices = Services(
                                name: nameController.text,
                                cost: costController.text,
                                support: supportController.text,
                                status: statusController.text,
                                promotional: promotionalController.text,
                                describe: describeController.text,
                                usedtime: dateinputusedtime.text,
                                id: widget.oldServices.id,
                                isFavorite: false,
                                isEdit: widget.oldServices.isEdit,
                              );
                              print(widget.oldServices.name + "\n"+ editservices.name);
                              context.read<ServicesBloc>().add(
                                EditServices(oldServices: widget.oldServices, newServices: editservices, index: widget.index),
                              );
                              showSnackbar(context);
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFEA530A),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              CustomPageRoute(
                                  child: CreateServicePack(
                                    services: Services(
                                      status: '',
                                      promotional: '',
                                      describe: '',
                                      support: '',
                                      cost: '',
                                      id: '',
                                      name: '',
                                      usedtime: '',
                                      isFavorite: false,
                                      isEdit: false,
                                    ),
                                  ),
                                  direction: AxisDirection.right),
                            );
                          },
                          child: Text(
                            'Quay lại',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
