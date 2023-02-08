import 'package:base_flutter/bloc/home_viewmodel.dart';
import 'package:base_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/ui/common/header_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Home",
        callback: () {
          vm.logOut();
          Navigator.pushNamed(context, Routes.login); // TODO: need update
        },
      ),
      body: const Text("Home"),
    );
  }
}
