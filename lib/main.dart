import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World Time App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'World Time App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _selectedCity;
  late String _currentTime;
  late Timer _timer;

  final Map<String, String> _cityMap = {
    'Africa/Cairo': 'Cairo',
    'Asia/Tokyo': 'Tokyo',
    'Europe/London': 'London',
    'America/New_York': 'New York',
  };

  @override
  void initState() {
    super.initState();
    _selectedCity = 'Africa/Cairo';
    _currentTime = _getCurrentTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final offset = DateTime.now().timeZoneOffset;
    final timeZoneOffset = offset.inHours > 0
        ? '+${offset.inHours.toString().padLeft(2, '0')}'
        : '${offset.inHours.toString().padLeft(2, '0')}';
    final timeZoneMinuteOffset = offset.inMinutes.remainder(60).toString().padLeft(2, '0');
    final timeZoneString = 'GMT$timeZoneOffset:$timeZoneMinuteOffset';

    final formatter = DateFormat('hh:mm:ss a');
    final dateTimeWithZone = DateTime.now().toUtc().add(Duration(hours: _getTimeZoneOffsetInHours(_selectedCity)));
    final formattedTimeWithZone = formatter.format(dateTimeWithZone);

    return '$_selectedCity ($timeZoneString) \n$formattedTimeWithZone';
  }

  int _getTimeZoneOffsetInHours(String location) {
    switch (location) {
      case 'Africa/Cairo':
        return 2;
      case 'Asia/Tokyo':
        return 9;
      case 'Europe/London':
        return 1;
      case 'America/New_York':
        return -4;
      default:
        return 0;
    }
  }

  void _onCitySelected(String? value) {
    if (value != null) {
      setState(() {
        _selectedCity = value;
        _currentTime = _getCurrentTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Time:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              _currentTime,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            DropdownButton<String>(
              value: _selectedCity,
              onChanged: _onCitySelected,
              items: _cityMap.entries.map<DropdownMenuItem<String>>((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}