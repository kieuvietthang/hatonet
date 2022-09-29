// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/model/candidate.dart';

class ItemCandidate extends StatefulWidget {
  Candidate item;

  VoidCallback onClickItem;

  ItemCandidate({Key? key, required this.item, required this.onClickItem})
      : super(key: key);

  @override
  State<ItemCandidate> createState() => _ItemCandidateState();
}

class _ItemCandidateState extends State<ItemCandidate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 70,
                    child: Image.asset(
                      widget.item.image,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.item.name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Vừa ứng tuyển vào vị trí',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              widget.item.nominee,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.item.job,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.item.time,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 1,
                  color: Color(0xFFD9D0D0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
