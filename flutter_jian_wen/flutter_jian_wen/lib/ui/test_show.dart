import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
             SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("cehs"),
                background: Image.network(
                  "https://cdn0.vox-cdn.com/hermano/verge/product/image/8844/akrales_180913_2950_0066_squ.jpg",
                  fit: BoxFit.cover,
                ),

                //Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2458696988,2288615185&fm=26&gp=0.jpg"),
              ),
            ),
//            SliverGrid(
//              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200.0,
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 4.0,
//              ),
//              delegate: SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//                  return Container(
//                    alignment: Alignment.center,
//                    color: Colors.teal[100 * (index % 9)],
//                    child: Text('Grid Item $index'),
//                  );
//                },
//                childCount: 20,
//              ),
//            ),
            SliverFixedExtentList(

              itemExtent: 650.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: WebView(
                      initialUrl: "https://flutterchina.club/",
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                },
                childCount: 1
              ),
            ),
          ],
        ),
      ),
    );
  }
}
