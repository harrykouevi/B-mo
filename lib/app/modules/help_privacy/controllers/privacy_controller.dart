/*
 * File name: privacy_controller.dart
 * Last modified: 2023.01.26 at 18:22:04
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../services/global_service.dart';

class PrivacyController extends GetxController {
  late WebViewController webView;

  @override
  void onInit() {
    webView = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("${Get.find<GlobalService>().baseUrl}privacy/index.html"));
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.onInit();
  }
}
