import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  dynamic titleList;
  dynamic picList;
  dynamic urlList;

  DetailPage(this.titleList, this.picList, this.urlList);

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(titleList, picList, urlList);
  }
}

class DetailPageState extends State<DetailPage> {
  dynamic titleList;
  dynamic picList;
  dynamic urlList;

  DetailPageState(this.titleList, this.picList, this.urlList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: getBodyTest(),
      ),
    );
  }


  Widget getBodyTest() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
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
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
