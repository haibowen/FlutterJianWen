import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable

class DetailPageNews extends StatelessWidget {
  final dynamic titleList;
  final dynamic picList;
  final dynamic urlList;

  DetailPageNews(this.titleList, this.picList, this.urlList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(urlList.toString() + "   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(picList.toString() + " ****************************************");
    return getBodyTest();
  }

  Widget getBodyTest() {
    final Completer<WebViewController> _controller =
        Completer<WebViewController>();
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  titleList,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                background: Image.network(
                  picList,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: WebView(
          initialUrl: urlList,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
