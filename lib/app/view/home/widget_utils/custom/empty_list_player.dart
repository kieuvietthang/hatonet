import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/module/res/colors.dart';
import 'package:hatonet_hcn/app/module/res/string.dart';
import 'package:hatonet_hcn/app/module/res/text.dart';


Widget EmptyListPlayer() {
  return SafeArea(
    child: Center(
      child: Text(
        txt_empty_list_player,
        style: TextStyle(
            color: kWhite,
            fontSize: text_16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal),
        )
    ),
  );
}
