import 'package:flutter/material.dart';
import 'package:flutter_map_picker_code4func/location.dart';
import 'package:flutter_map_picker_code4func/picker_page.dart';

//https://www.youtube.com/watch?v=0heSAx5Bskw
//https://github.com/thanhniencung/flutter-map-picker

//Tham khảo thêm: (Các packages hỗ trợ tốt hơn)
//https://pub.dev/packages/google_maps_place_picker/versions/2.1.0-nullsafety.3
//https://pub.dev/packages/google_map_location_picker/example

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _lat = 0, _lng = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  Location location = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPickerPage()),
                  );
                  if (location != null) {
                    setState(() {
                      _lat = location.lat;
                      _lng = location.lng;
                    });
                  }
                },
                child: Text(
                  'Picker Location',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '$_lat, $_lng',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
