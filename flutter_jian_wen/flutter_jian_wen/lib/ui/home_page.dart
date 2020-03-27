import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jian_wen/utils/HttpUtils.dart';

import 'detail_page.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('简闻'),
          actions: <Widget>[],
        ),
        drawer: Drawer(
          child: getDrawer(),
        ),
        body:HomePageState(),
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
                    Text(
                      '简单却也不简单',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    Text(
                      '读你想读的，看你想看的',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemBuilder: getListDrawerItem,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
        )
      ],
    );
  }

  Widget getListDrawerItem(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.event),
      title: Text('设置'),
      onTap: () {},
    );
  }
}


class HomePageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageStateShow();
  }


}

class HomePageStateShow extends State<HomePageState> {
  List<dynamic> titleList = [];
  List<dynamic> picList = [];
  List<dynamic> urlList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInternetData();
  }

  @override
  Widget build(BuildContext context) {
    getInternetData();

    return getBody();
  }

  Widget getBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行三列
          childAspectRatio: 1.0 //显示区,
      ),
      itemBuilder: getListBuilder,
      itemCount: titleList.length,
    );
  }

  Widget getListBuilder(BuildContext context, int index) {
    return Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailPageNews(
                            titleList[index], picList[index], urlList[index])));
          },
          child: Container(
//          width: MediaQuery.of(context).size.width/2,
            child: Column(
              children: <Widget>[
                Image.network(
                  picList[index],
                  fit: BoxFit.contain,
                ),
                Text(
                  titleList[index],
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ));
  }


  Future getInternetData() async {
    var temp = await HttpUtils.getInstance().get(
        'http://v.juhe.cn/toutiao/index?type=keji&key=27d98876a75e6fb3f9eac28f71d807a0');
    var result = temp.data['result'];
    print(result['data']);
    for (Map map in result['data']) {
      titleList.add(map['title']);
      picList.add(map['thumbnail_pic_s']);
      urlList.add(map['url']);
    }
  }
}
