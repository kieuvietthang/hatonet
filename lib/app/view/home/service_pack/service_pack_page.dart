// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/view/home/service_pack/fake_service_pack.dart';
import 'package:hatonet_hcn/app/view/home/service_pack/item_service_pack.dart';
import 'package:hatonet_hcn/app/view/home/service_pack/item_service_pack_list.dart';

class ServicePackPage extends StatefulWidget {
  const ServicePackPage({Key? key}) : super(key: key);

  @override
  State<ServicePackPage> createState() => _ServicePackPageState();
}

class _ServicePackPageState extends State<ServicePackPage> {
  int _currentPage = 0;

  PageController _controller = PageController();

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List<Widget> _servicePack = [
    ItemServicePack(
        name: 'BASIC',
        pirce: '5.000.000 VND',
        number: '+ 1',
        image: 'assets/icons/ic_correct.svg'),
    ItemServicePack(
        name: 'PREMIUM',
        pirce: '8.000.000 VND',
        number: '+ 2',
        image: 'assets/icons/ic_correct.svg'),
    ItemServicePack(
        name: 'BASIC',
        pirce: '4.900.000 VND',
        number: '+ 2',
        image: 'assets/icons/ic_correct.svg'),
    ItemServicePack(
        name: 'PREMIUM',
        pirce: '7.490.000 VND',
        number: '+ 2',
        image: 'assets/icons/ic_correct.svg'),
    ItemServicePack(
        name: 'BASIC',
        pirce: '6.000.000 VND',
        number: '+ 2',
        image: 'assets/icons/ic_correct.svg'),
    ItemServicePack(
        name: 'PREMIUM',
        pirce: '1.000.000 VND',
        number: '+ 2',
        image: 'assets/icons/ic_correct.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ]
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_apps.svg',
                      height: 24,
                      width: 24,
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Color(0xFFEA530A), shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/ic_users.svg',height: 10,width: 10,),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(2.0, 1.0))
                      ]),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          hintText: 'Search...',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Gói dịch vụ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFF6116),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 220,
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemCount: _servicePack.length,
                      onPageChanged: _onChanged,
                      itemBuilder: (context, int index) {
                        return _servicePack[index];
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _servicePack.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Color(0xFFFF6116)
                              : Color(0xFFC9DCED)),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Lịch sử giao dịch',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF6116)),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'chi tiết',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF6116)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                    itemCount: FAKE_SERVICE_PAKE.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ItemServicePackList(
                      item: FAKE_SERVICE_PAKE[index],
                      onClickItem: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );


  }
}
