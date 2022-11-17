import 'package:get_it/get_it.dart';
import 'package:hatonet_hcn/app/view/home/create_news_request_page/customer_phone_list_viewmodel.dart';
import 'package:hatonet_hcn/app/view/home/webview/webview_viewmodel.dart';

import '../module/common/navigator_screen.dart';
import '../module/local_storage/shared_pref_manager.dart';
import '../module/network/request/auth_request.dart';
import '../module/repository/data_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //local storage
  getIt.registerSingleton<UserSharePref>(UserSharePref());
  getIt.registerSingleton<SharedPrefManager>(SharedPrefManager());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  //repository
  getIt.registerFactory<AuthRequest>(() => AuthRequest());
  //getIt.registerFactory<SocketManager>(() => SocketManager());

  //data repository
  getIt.registerFactory<DataRepository>(() => DataRepository(
        getIt<AuthRequest>(),
        getIt<SharedPrefManager>(),
        // getIt<SocketManager>(),
      ));


  //view model
  getIt.registerFactory<CustomerPhoneListViewModel>(
          () => CustomerPhoneListViewModel(getIt<DataRepository>()));




  getIt.registerFactoryParam<WebviewViewModel, List<dynamic>, dynamic>(
          (param1, _) => //no need param2
      WebviewViewModel(webviewParam: param1[0]));

}
