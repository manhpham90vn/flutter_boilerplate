import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header(
      {Key? key,
      required this.title,
      this.leftBtnTitle,
      this.leftBtnCallback,
      this.rightBtnTitle,
      this.rightBtnCallback})
      : super(key: key);

  final String title;
  final String? leftBtnTitle;
  final VoidCallback? leftBtnCallback;
  final String? rightBtnTitle;
  final VoidCallback? rightBtnCallback;

  @override
  Widget build(BuildContext context) {
    logDebug("Rebuild Header");

    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: leftBtnTitle == null
          ? null
          : TextButton(
              onPressed: () => leftBtnCallback!(),
              child: Text(
                leftBtnTitle!,
                style: const TextStyle(fontSize: 18),
              )),
      leadingWidth: 80,
      actions: rightBtnCallback == null
          ? []
          : <Widget>[
              TextButton(
                onPressed: () {
                  rightBtnCallback!();
                },
                child: Text(
                  rightBtnTitle!,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
