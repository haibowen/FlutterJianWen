

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return DetailPageState();
  }

}

class DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: getBody(),
      ),
    );



  }

  Widget getBody(){
    return GridView();
  }

}