import 'package:base_flutter/main.dart';
import 'package:base_flutter/ui/common/header_ui.dart';
import 'package:base_flutter/ui/common/input_text_field_ui.dart';
import 'package:base_flutter/bloc/login_viewmodel.dart';
import 'package:base_flutter/ui/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import '../model/error_response.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key, required this.vm}) : super(key: key);

  final LoginViewModel vm;

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  @override
  void initState() {
    super.initState();

    widget.vm.successController.listen((event) {
      Navigator.pushNamed(context, Routes.home);
    }, onError: (error) {
      if (error is ErrorResponse) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? "Unknown error")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Unknown error")));
      }
    });
  }

  @override
  void dispose() {
    widget.vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logDebug("Rebuild _LoginControllerState");

    return LoadingOverlay(
        stream: widget.vm.isLoadingController,
        child: Scaffold(
          appBar: const Header(
            title: "Login",
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder(
                    stream: widget.vm.loginOutputController,
                    builder: (context, snapshot) {
                      return InputTextField(
                        hintText: "Email",
                        onChanged: widget.vm.onChangedLogin,
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
                    stream: widget.vm.passOutputController,
                    builder: (context, snapshot) {
                      return InputTextField(
                        obscureText: true,
                        hintText: "Password",
                        onChanged: widget.vm.onChangedPass,
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () => widget.vm.login(),
                      child: const Text("Login"))
                ],
              ),
            ),
          ),
        ));
  }
}
