import 'package:base_flutter/bloc/home_viewmodel.dart';
import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/ui/common/header_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final vm = getIt<HomeViewModel>();

  @override
  void initState() {
    super.initState();

    vm.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Home",
        leftBtnTitle: "Reload",
        leftBtnCallback: () {
          vm.getData();
        },
        rightBtnTitle: "Logout",
        rightBtnCallback: () {
          vm.logOut();
          Navigator.pushNamed(context, Routes.login); // TODO: need update
        },
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
