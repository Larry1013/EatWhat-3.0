import 'package:flutter/material.dart';
class RestaurantCreateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('新增餐廳'),
        actions: <Widget>[
         IconButton(
           icon: Icon(Icons.add),
           tooltip: 'Naviageion Menu :)',
        onPressed: null,
        )
      ],
    ),
    body: Center(
      child: Container(
        width: 300,
        height: 300,
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '請輸入餐廳名字'
          ),
        ),
      ),
      ),
    );
  }
}