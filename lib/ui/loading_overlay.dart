import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key, required this.child, required this.stream});

  final Widget child;
  final Stream stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Stack(
          children: [
            child,
            if (snapshot.data == true)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: const Opacity(
                  opacity: 0.1,
                  child: ModalBarrier(dismissible: false, color: Colors.black),
                ),
              ),
            if (snapshot.data == true)
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        );
      },
      stream: stream,
    );
  }
}
