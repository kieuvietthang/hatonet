import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/delete_history_pack/delete_history_pack.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case DeleteHistoryPack.id:
        return MaterialPageRoute(
          builder: (_) => DeleteHistoryPack(),
        );
      default:
        return null;
    }
  }
}