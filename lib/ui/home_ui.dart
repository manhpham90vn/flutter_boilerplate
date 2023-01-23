import 'package:flutter/material.dart';
import 'package:base_flutter/ui/common/header_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(title: "Home",),
      body: Text("Home"),
    );
  }
}


