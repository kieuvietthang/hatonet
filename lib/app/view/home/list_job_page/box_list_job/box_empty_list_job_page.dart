import 'package:flutter/material.dart';
class BoxEmptyListJobPage extends StatefulWidget {
  BoxEmptyListJobPage({Key? key}) : super(key: key);
  @override
  State<BoxEmptyListJobPage> createState() => _BoxEmptyListJobPageState();
}
class _BoxEmptyListJobPageState extends State<BoxEmptyListJobPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset('assets/images/boxicon.png',height: 190,),
              SizedBox(height: 20,),
              Text('Hiện trống do bạn chưa lưu trữ thông tin !!',
                style: TextStyle(color: Color(0xFF808080), fontSize: 18,fontWeight:FontWeight.w500,),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
