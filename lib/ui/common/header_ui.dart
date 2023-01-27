import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    logDebug("Rebuild Header");

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
