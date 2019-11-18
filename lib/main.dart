import 'package:flutter/material.dart';
import 'package:flutter_hello_world/CreateResturantWidget.dart';
import "dart:math";
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(EatWhatApp());
}
class Restaurant {
  String name;
  String content;
  Restaurant({ this.name, this.content});
}
class EatWhatApp extends StatelessWidget {
  @override
  EatWhatApp({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helooooo',
      home: EatWhatHome(),
      routes: { '/create': (BuildContext context) => RestaurantCreateWidget()
      },
    );
  }
}
class _EatWhatHomeState extends State<EatWhatHome> {
  List<String> restaurantNames = [];
  // Function - Data Loading
  _loadRestaurantNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      restaurantNames = (prefs.getStringList('names') ?? []);
    });
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
  void showRandomRestaurant(BuildContext context) {
    showDialog(context: context,
        builder: (context) {
          return new SimpleDialog(
            title: Text("隨機餐廳"),
            children: <Widget>[
              Center(
                child: Text(restaurantNames[(new Random()).nextInt(restaurantNames.length)]),
              )
            ],
          );
        }
    );
  }
  Widget createListView() {
    return ListView.builder(padding: const EdgeInsets.all(8),
      itemCount: restaurantNames.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {

          },
          child: Container(
            height: 50,
            color: Colors.amber[600],
            child: Center(
              child: Text(restaurantNames[index]),
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadRestaurantNames();
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
class EatWhatHome extends StatefulWidget {
  @override _EatWhatHomeState createState() => _EatWhatHomeState();
}