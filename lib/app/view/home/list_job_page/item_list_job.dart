import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/list_job.dart';

class ItemListJob extends StatefulWidget {
  ListJob item;
  VoidCallback onClickItem;

  ItemListJob({Key? key, required this.item, required this.onClickItem})
      : super(key: key);

  @override
  State<ItemListJob> createState() => _ItemListJobState();
}

class _ItemListJobState extends State<ItemListJob> {
  bool _isBluetoothOn = false;
  bool _isBluetoothhOn = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => OptimalPage()),
        // );
      },
      child: Padding(
        padding: EdgeInsets.only(top:10, bottom: 10),
        child: Container(
          height: 270,
          color: Colors.white,
          width: double.infinity,
          child:Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,top: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset('assets/images/logo hatonet-06.png',height: 60,width:60),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.tittle,
                          style: TextStyle(color: Color(0xFF000000), fontSize: 15,fontWeight:FontWeight.w500, ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 130,top:5),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_simple_calendar.svg',
                                height: 13.18,
                                width: 13.25,
                                color: Colors.black,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: ' Kinh nghiệm: ',
                                  style: TextStyle(color: Color(0xFF000000), fontSize: 14,fontWeight:FontWeight.w300, ),
                                  children: <TextSpan>[
                                TextSpan(text: widget.item.date, style: TextStyle(color: Color(0xFF000000), fontSize: 14,fontWeight:FontWeight.w300, ),),
                                TextSpan(text:' năm', style: TextStyle(color: Color(0xFF000000), fontSize: 14,fontWeight:FontWeight.w300, ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 37,top:5),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_building_line.svg',
                                height: 13.18,
                                width: 13.25,
                                color: Colors.black,
                              ),
                              Text(
                                widget.item.company,
                                style: TextStyle(color: Color(0xFF808080), fontSize: 12,fontWeight:FontWeight.w500,),
                              ),
                              SvgPicture.asset(
                                'assets/icons/ic_location.svg',
                                height: 13.18,
                                width: 13.25,
                                color: Colors.black,
                              ),
                              Text(widget.item.city,
                                style: TextStyle(color: Color(0xFF808080), fontSize: 12,fontWeight:FontWeight.w500,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10,top:14,bottom: 14),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 70.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD2C4),
                          border: Border.all(
                            color: Color(0xFFFF5400),
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(child: Text('NodeJS', style: new TextStyle(fontSize: 12.0, color: Color(0xFFFF5400)),),),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD2C4),
                            border: Border.all(
                              color: Color(0xFFFF5400),
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(child: Text('IOS', style: new TextStyle(fontSize: 12.0, color: Color(0xFFFF5400),),),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 70.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFF5400),
                              width: 0.3,
                            ),
                            color: Color(0xFFFFD2C4),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(child:  Text('Android', style: new TextStyle(fontSize: 12.0, color: Color(0xFFFF5400)),),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 59.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD2C4),
                            border: Border.all(
                              color: Color(0xFFFF5400),
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(child: Text('Flutter', style: new TextStyle(fontSize: 12.0,color: Color(
                              0xFFFF5100)),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Còn ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: widget.item.day, style: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFFFF5400))),
                          TextSpan(text: ' ngày'),
                        ],
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        text: widget.item.money,
                        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500,color: Color(0xE4FF4600)),
                        children: <TextSpan>[
                          TextSpan(text: ' triệu', style:   TextStyle(fontSize: 12.0, color: Colors.black),),
                          TextSpan(text: ' ứng viên / tháng', style:   TextStyle(fontSize: 12.0, color: Colors.black),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                  child: Text(widget.item.deatailjob, maxLines: 3,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14.0, color: Colors.grey),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(right: 1),
                      child: SvgPicture.asset(
                        widget.item.image,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    Container(child: Text(widget.item.status, style: TextStyle(fontSize: 12.0, color: Colors.black),)),
                    Spacer(),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _isBluetoothOn = !_isBluetoothOn;
                          });
                        },
                        child: Icon(
                          _isBluetoothOn ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                       SizedBox(width: 10,),
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
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        _showMaterialDialog();
                      },
                        child: Icon( Icons.reply, size: 25,color: Colors.grey,)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            width: double.infinity,
            child: AlertDialog(
              title: Text('Material Dialog'),
              content: Text('Hey! I am Coflutter!'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      _dismissDialog();
                    },
                    child: Text('Close')),
                TextButton(
                  onPressed: () {
                    print('HelloWorld!');
                    _dismissDialog();
                  },
                  child: Text('HelloWorld!'),
                )
              ],
            ),
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}


