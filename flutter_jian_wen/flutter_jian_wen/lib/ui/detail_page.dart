import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable

dynamic urlList1;

class DetailPageNews extends StatelessWidget {
  final dynamic titleList;
  final dynamic picList;
  final dynamic urlList;

  DetailPageNews(this.titleList, this.picList, this.urlList) {
    urlList1 = urlList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(urlList.toString() + "   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(picList.toString() + " ****************************************");
    return getBodyTest(context);
  }

  Widget getBodyTest(BuildContext context) {
    final Completer<WebViewController> _controller =
        Completer<WebViewController>();
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              pinned: true,
              expandedHeight: 250.0,
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
//            SliverFixedExtentList(
//              itemExtent: 800,
//              delegate:
//                  SliverChildBuilderDelegate((BuildContext context, int index) {
//                return WebView(
//                  initialUrl: urlList,
//                  javascriptMode: JavascriptMode.unrestricted,
//                );
//              }, childCount: 1),
//            ),
            SliverAnimatedList(
              itemBuilder: _buildItem,
              initialItemCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildItem(
    BuildContext context, int index, Animation<double> animation) {
  return Container(
    height: 800,
    child: WebView(
      initialUrl: urlList1,
      javascriptMode: JavascriptMode.unrestricted,
    ),
  );
}
