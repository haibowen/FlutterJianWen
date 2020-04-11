import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jian_wen/utils/HttpUtils.dart';
import 'package:flutter_jian_wen/utils/data_url.dart';

import 'detail_page.dart';

List<dynamic> titleList = [];
List<dynamic> picList = [];
List<dynamic> urlList = [];
List<dynamic> typeList = ["头条", "社会", "国内", "娱乐", "体育", "军事", "科技", "财经", "时尚"];
List<Widget> iconShow = [
  Icon(Icons.fiber_new),
  Icon(Icons.book),
  Icon(Icons.multiline_chart),
  Icon(Icons.music_note),
  Icon(Icons.laptop_chromebook),
  Icon(Icons.airline_seat_flat),
  Icon(Icons.filter),
  Icon(Icons.photo_library),
  Icon(Icons.keyboard),
];

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
        body: FutureBuilder(
            future: getInternetData(DataUrl().CAIJINGURL),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                for (Map map in snapshot.data) {
                  titleList.add(map['title']);
                  picList.add(map['thumbnail_pic_s']);
                  urlList.add(map['url']);
                }

                return getBody();
              } else if (snapshot.hasError) {
                return Text('出错了');
              }
              return Text('默认返回');
            }),
      ),
    );
  }

  Widget getBodyShow(String type) {
    return FutureBuilder(
        future: getInternetData(type ?? DataUrl().KEJIURL),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            for (Map map in snapshot.data) {
              titleList.add(map['title']);
              picList.add(map['thumbnail_pic_s']);
              urlList.add(map['url']);
            }

            return getBody();
          } else if (snapshot.hasError) {
            return Text('出错了');
          }
          return Text('默认返回');
        });
  }

  Future getInternetData(String type) async {
    var temp = await HttpUtils.getInstance().get(type);
    var result = temp.data['result'];
    print(result['data']);
    return result['data'];
  }

  Widget getDrawer() {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          height: 180.0,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5.0),
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
          itemCount: typeList.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
        ),
      ],
    );
  }

  Widget getListDrawerItem(BuildContext context, int index) {
    return ListTile(
      leading: iconShow[index],
      title: Text(typeList[index]),
      onTap: () {
        getInternetData(DataUrl().JUNSHIURL);
      },
    );
  }
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
              builder: (context) => DetailPageNews(
                  titleList[index], picList[index], urlList[index])));
    },
    child: Container(
      height: 180,
//          width: MediaQuery.of(context).size.width/2,
      child: Column(
        children: <Widget>[
          Image.network(
            picList[index],
            fit: BoxFit.contain,
            height: 120,
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
