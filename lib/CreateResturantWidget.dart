import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RestaurantCreateWidget extends StatefulWidget {
  @override _RestaurantCreateWidgetState createState() => _RestaurantCreateWidgetState();
}
class _RestaurantCreateWidgetState extends State<RestaurantCreateWidget> {
  @override
  final List<String> DefaultRestaurants = <String>[
    '城市漢堡',
    '昆陽牛肉麵',
    '台南小吃',
    '越南小吃',
    '闞記涼麵',
    '三商巧福',
    '小水餃',
    '八方雲集',
    '燒臘',
    '頂紅',
    '北大荒'];
  String newName = "";
  TextEditingController _textInputController = TextEditingController();
  void _createRestaurant(String restaurantName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> restaurantNames = pref.getStringList("names");
    if (restaurantNames == null) {
      setDefaultData(pref);
    } else {
      if (restaurantNames.length > 0) {
        restaurantNames.add(restaurantName);
        pref.setStringList("names", restaurantNames);
      } else {
        setDefaultData(pref);
      }
    }
  }
  void setDefaultData(SharedPreferences pref) {
    List<String> restaurantNames = DefaultRestaurants;
    pref.setStringList("names", restaurantNames);
  }
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('新增餐廳'),
        actions: <Widget>[
         IconButton(
           icon: Icon(Icons.add),
           tooltip: 'Naviageion Menu :)',
        onPressed: () {
              _createRestaurant(_textInputController.text);
              Navigator.pop(context);
        },
        ),
      ],
    ),
    body: Center(
      child: Container(
        width: 300,
        height: 300,
        child: TextField(
          controller: _textInputController,
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