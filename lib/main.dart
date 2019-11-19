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
  List<String> restaurantNames = [];
  // Function - Data Loading
  _loadRestaurantNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> localNames = (prefs.getStringList('names') ?? []);
      if (localNames.length == 0) {
        restaurantNames = DefaultRestaurants;
        prefs.setStringList("names", restaurantNames);
      } else {
        restaurantNames = localNames;
      }
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
            color: Colors.redAccent,
            child: Center(
              child: Text(
                restaurantNames[index],
                style: TextStyle(color: Colors.white38.withOpacity(1.0)),
              )
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _loadRestaurantNames();
  }
  @override
  Widget build(BuildContext context) {
    _loadRestaurantNames();
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