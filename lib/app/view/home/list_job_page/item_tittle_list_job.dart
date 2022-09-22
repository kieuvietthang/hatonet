import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/tittle_list_job.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/detail_job.dart';

class ItemTittleListJob extends StatefulWidget {
  TittleListJob item;
  VoidCallback onClickItem;

  ItemTittleListJob({Key? key, required this.item, required this.onClickItem})
      : super(key: key);

  @override
  State<ItemTittleListJob> createState() => _ItemTittleListJobState();
}

class _ItemTittleListJobState extends State<ItemTittleListJob> {
  bool _isBluetoothOn = false;
  bool _isBluetoothhOn = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.down ,
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailJobPage()),
        );
      },
      onLongPress: (){

      },
      child: Container(
       height: 70,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // tên công việc
               Padding(
                 padding: EdgeInsets.only(left: 10,top:2),
                 child: Text(
                   widget.item.tittle,
                   style: TextStyle(color: Color(0xFF000000), fontSize: 13,fontWeight:FontWeight.w300, ),
                 ),
               ),
               //
               Row(
                 children: [
                   SizedBox(width: 10,height: 4,),
                   // logo công ty
                   Image.asset(widget.item.avatar,height: 50,width: 50,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           //icon kinh nghiệm
                           SvgPicture.asset(
                             'assets/icons/ic_simple_calendar.svg',
                             height: 13.18,
                             width: 13.25,
                             color: Colors.black,
                           ),
                           // text kinh nghiệm
                           RichText(
                             text: TextSpan(
                               text: ' Kinh nghiệm: ',
                               style: TextStyle(color: Color(0xFF000000), fontSize: 11,fontWeight:FontWeight.w300, ),
                               children: <TextSpan>[
                             TextSpan(text: widget.item.date, style: TextStyle(color: Color(0xFF000000), fontSize: 11,fontWeight:FontWeight.w300, ),),
                             TextSpan(text:' năm', style: TextStyle(color: Color(0xFF000000), fontSize: 11,fontWeight:FontWeight.w300, ),),
                               ],
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 2,),
                       Row(
                         children: [
                           // logo tên công ty
                           SvgPicture.asset(
                             'assets/icons/ic_building_line.svg',
                             height: 13.18,
                             width: 13.25,
                             color: Colors.black,
                           ),
                           // text tên công ty
                           Text(
                             widget.item.company,
                             style: TextStyle(color: Colors.black, fontSize: 11,fontWeight:FontWeight.w300,),
                           ),
                         ],
                       ),
                       SizedBox(height: 2,),
                       Row(
                         children: [
                           //logo thành phố
                           SvgPicture.asset(
                             'assets/icons/ic_location.svg',
                             height: 13.18,
                             width: 13.25,
                             color: Colors.black,
                           ),
                           // text tên thành phố
                           Text(widget.item.city,
                             style: TextStyle(color: Colors.black, fontSize: 11,fontWeight:FontWeight.w300,),
                           ),
                         ],
                       ),
                     ],
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       // icon lưu
                       InkWell(
                         onTap: (){
                           setState(() {
                             _isBluetoothhOn = !_isBluetoothhOn;
                           });
                         },
                         child: Icon(
                           _isBluetoothhOn ? Icons.turned_in_not : Icons.turned_in_sharp,
                           color: Colors.yellow,
                           size: 25,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ],
           ),
         ],
       ),
          ),

    );;
  }
}


