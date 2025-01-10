import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:loginx/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reqres'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController.emailController.value,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: loginController.passwordController.value,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  loginController.loginAPI();
                },
                child:loginController.loading.value? CircularProgressIndicator(): Container(
                  height: 45,
                  color: Colors.grey,
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
