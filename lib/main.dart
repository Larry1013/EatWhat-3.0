import 'package:flutter/material.dart';
import 'package:flutter_hello_world/CreateResturantWidget.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import "dart:math";
void main() {
  runApp(HelloWorldApp());
}
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helooooo',
      home: HelloWorldHome(),
      routes: { '/create': (BuildContext context) => RestaurantCreateWidget()
      },
    );
  }
}
class MyFirstStatelessWidget extends StatelessWidget {
  const MyFirstStatelessWidget ({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A));
  }
}
class HelloWorldHome extends StatelessWidget {
  final List<String> restaurants = <String>[
    '城市漢堡',
    '昆陽牛肉麵',
    '台南小吃',
    '越南小吃',
    '闞記涼麵',
    '三商巧福',
    '小水餃',
    '八分雲集',
    '燒臘',
    '頂紅',
    '北大荒'];
//  }
  void showRandomRestaurant(BuildContext context) {
      showDialog(context: context,
          builder: (context) {
            return new SimpleDialog(
              title: Text("隨機餐廳"),
              children: <Widget>[
                Center(
                  child: Text(restaurants[(new Random()).nextInt(restaurants.length)]),
                )
              ],
            );
          }
      );
  }
  // Function - Create AppBar
  AppBar createAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.fastfood),
        tooltip: 'Naviageion Menu :)',
        onPressed: () {
          showRandomRestaurant(context);
        },
      ),
      title: Text('聰明的餐廳選擇器'),
    );
  }
  // Function - Create Body
  Widget createBody() {
    return Center(
      child: Text('目前沒有任何餐廳'),
    );
  }
  Widget createListView() {
    return ListView.builder(padding: const EdgeInsets.all(8),
    itemCount: restaurants.length,
    itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[600],
          child: Center(
            child: Text(restaurants[index]),
          ),
        );
      },
    );
  }
  Widget createListViewBodyDefault() {
    return ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('城市漢堡'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(
          child: Text('昆陽牛肉麵'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[400],
        child: const Center(
          child: Text('台南小吃'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('越南小吃'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('闞記涼麵'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('三商巧福'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('小水餃'),
        ),
      ),
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(
          child: Text('八方雲集'),
        ),
      ),
    ],
    );
  }
  // Function - Create FloatButton
  FloatingActionButton createFloatingButton(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add',
      child: Icon(Icons.add),
      onPressed: () {
        showCreateRestaurantWidget(context);
      }
    );
  }
  void showCreateRestaurantWidget(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RestaurantCreateWidget(), fullscreenDialog: true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      body: createListView(),
      floatingActionButton: createFloatingButton(context),
    );
  }
}