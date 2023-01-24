import 'package:base_flutter/ui/common/header_ui.dart';
import 'package:base_flutter/ui/common/input_text_field_ui.dart';
import 'package:base_flutter/viewModel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/data/remote/service.dart';
import '../main.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final vm = LoginViewModel();

  @override
  void initState() {
    super.initState();

    vm.formStream.listen((event) async {
      if ((event as String) == "ok") {
        final result =
            await Service.login(emailController.text, passController.text);
        if (!mounted) return;
        if (result.isSuccess) {
          Navigator.pushNamed(context, Routes.home);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result.message ?? "Unknown message"),
          ));
        }
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: "Login"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: vm.loginStream,
                builder: (context, snapshot) {
                  return InputTextField(
                    hintText: "Email",
                    controller: emailController,
                    errorText:
                        snapshot.hasError ? snapshot.error as String : null,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: vm.passwordStream,
                builder: (context, snapshot) {
                  return InputTextField(
                    obscureText: true,
                    hintText: "Password",
                    controller: passController,
                    errorText:
                        snapshot.hasError ? snapshot.error as String : null,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    vm.validate(emailController.text, passController.text);
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
