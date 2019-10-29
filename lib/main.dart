import 'package:flutter/material.dart';
import 'package:tabs_pages/pages/home.page.dart';
import 'package:tabs_pages/pages/other.page.dart';
import 'package:tabs_pages/pages/settings.page.dart';

import 'models/MyTab.model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Tabs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsNavigation(),
    );
  }
}

class TabsNavigation extends StatefulWidget {
  @override
  _TabsNavigationState createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> with TickerProviderStateMixin {
  final List<MyTab> _tabs = [
    MyTab(icon: Icon(Icons.home), title: 'Home', page: HomePage()),
    MyTab(icon: Icon(Icons.settings), title: 'Setting', page: SettingsPage())
  ];
  
  MyTab _current;
  TabController _controller;
  
  void initState() {
    super.initState();
    _controller = new TabController(length: _tabs.length, vsync: this);
    _controller.addListener(_handleSelected);
    _current = _tabs[0];
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSelected () {
    setState(() {
     _current = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            tabs: _tabs.map((f) => Tab(icon: f.icon)).toList()
          ),
          title: Text(_current.title),
        ),
        body: TabBarView(
          controller: _controller,
          children: _tabs.map((f) => f.page).toList()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtherPage()),
            );
          },
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}