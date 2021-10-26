import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameWebview extends StatefulWidget {
  final weburl;
  const GameWebview({Key? key, this.weburl}) : super(key: key);

  @override
  _GameWebviewState createState() => _GameWebviewState();
}

class _GameWebviewState extends State<GameWebview> {
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WebView(
          initialUrl: widget.weburl,
          key: _key,
           allowsInlineMediaPlayback: true,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
