import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/news.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<News> dataList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('简闻'),
            actions: <Widget>[],
          ),
          drawer: Drawer(
            child: getDrawer(),
          ),
          body: getBody()),
    );
  }

  Widget getBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行三列
          childAspectRatio: 1.3 //显示区,
          ),
      itemBuilder: getListBuilder,
      itemCount: 6,
    );
  }

  Widget getListBuilder(BuildContext context, int index) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              'https://www.canva.cn/learn/wp-content/uploads/sites/17/2019/09/Snipaste_2019-09-24_15-21-59.png',
            ),
            Text('这是图片一')
          ],
        ),
      ),
    );
  }

  Widget getDrawer() {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          height: 250.0,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img.iplaysoft.com/wp-content/uploads/2019/free-images/free_stock_photo.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[

                    Text('简单却也不简单',style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    ),),
                    Text('读你想读的，看你想看的',style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),

        ListTile(
          leading: Icon(Icons.settings),
          title: Text('设置'),
        )
      ],
    );
  }
}
