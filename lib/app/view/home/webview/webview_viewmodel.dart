
import 'package:hatonet_hcn/app/di/injection.dart';
import 'package:hatonet_hcn/app/model/webview_param.dart';
import 'package:hatonet_hcn/app/module/common/navigator_screen.dart';
import 'package:hatonet_hcn/app/module/local_storage/shared_pref_manager.dart';
import 'package:hatonet_hcn/app/viewmodel/base_viewmodel.dart';

class WebviewViewModel extends BaseViewModel {
  NavigationService navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool _loading = true;
  WebviewParam? webviewParam;

  WebviewViewModel({this.webviewParam});

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
