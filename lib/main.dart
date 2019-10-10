import 'package:flutter/material.dart';
void main() {
  runApp(HelloWorldApp());
}
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helooooo',
      home: HelloWorldHome(),
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
  // Function - Create AppBar
  AppBar createAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.fastfood),
        tooltip: 'Naviageion Menu :)',
        onPressed: null,
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
  // Function - Create FloatButton
  FloatingActionButton createFloatingButton() {
    return FloatingActionButton(
      tooltip: 'Add',
      child: Icon(Icons.add),
      onPressed: null,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(),
      floatingActionButton: createFloatingButton(),
    );
  }
}