import 'package:base_flutter/app/app_router.dart';
import 'package:base_flutter/bloc/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/ui/common/header_ui.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.vm}) : super(key: key);

  final HomeViewModel vm;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    widget.vm.getDataSerial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Home",
        leftBtnTitle: "Reload",
        leftBtnCallback: () {
          widget.vm.getDataConcurrent();
        },
        rightBtnTitle: "Logout",
        rightBtnCallback: () {
          widget.vm.logOut();
          GoRouter.of(context).go(LoginRoute.path);
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
