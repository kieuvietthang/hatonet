import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/model/webview_param.dart';
import 'package:hatonet_hcn/app/view/home/webview/webview_viewmodel.dart';
import 'package:hatonet_hcn/app/view/home/widget_utils/base_scaffold.dart';
import 'package:hatonet_hcn/app/viewmodel/base_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends PageProvideNode<WebviewViewModel> {
  WebviewPage(WebviewParam? webviewParam) : super(params: [webviewParam]);

  @override
  Widget buildContent(BuildContext context) {
    return _WebviewContentPage(viewModel);
  }
}

class _WebviewContentPage extends StatefulWidget {
  final WebviewViewModel _webviewViewModel;

  _WebviewContentPage(this._webviewViewModel);

  @override
  _WebviewContentPageState createState() => _WebviewContentPageState();
}

class _WebviewContentPageState extends State<_WebviewContentPage> {
  WebviewViewModel get webviewViewModel => widget._webviewViewModel;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: webviewViewModel.webviewParam?.title ?? '',
      body: Stack(
        children: <Widget>[
          WebView(
            key: UniqueKey(),
            initialUrl: webviewViewModel.webviewParam?.url ?? '',
            javascriptMode: JavascriptMode.unrestricted,
            backgroundColor: Colors.white,
            onPageFinished: (finish) => webviewViewModel.loading = false,
          ),
         // _buildLoading(),
        ],
      ),
    );
  }

  // Consumer<WebviewViewModel> _buildLoading(){
  //   return Consumer<WebviewViewModel>(
  //     builder: (context, value, child){
  //       return value.loading ?  BuildProgressLoading()
  //           : Stack();
  //     },
  //   );
  // }
}
