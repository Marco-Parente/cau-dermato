import 'package:cau_dermato/UI/components/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Dra. Cláudia Cherin"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
