import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

// class LoginController extends GetxController {
//   final emailController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;

//   RxBool loading = false.obs;

//   void loginAPI() async {
//     loading.value = true;

//     try {
//       // Map newData = {
//       //   'email': emailController.value.text,
//       //   'password': passwordController.value.text,
//       // };

//       final response = await post(
//           Uri.parse('https://reqres.in/api/login'),
//           body: {'email': emailController.value.text,'password': passwordController.value.text,}
//         );

//       // final response = await post(
//       //   Uri.parse('https://reqres.in/api/login'),
//       //   headers: {
//       //     'Content-Type': 'application/json',
//       //   },
//       //   body: jsonEncode(newData),
//       // );

//       var data = jsonDecode(response.body); // response token
//       print(response.statusCode);
//       print(data);

//       if (response.statusCode == 200) {
//         loading.value = false;
//         Get.snackbar('Login succesful', 'success');
//       } else {
//         loading.value = false;
//         Get.snackbar('Login Failed', data['error']);
//       }
//     } catch (e) {
//       loading.value = false;
//       Get.snackbar('Exception', e.toString());
//     }
//   }
// }

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginAPI() async {
    loading.value = true;

    try {
      // Map newData = {
      //   'email': emailController.value.text,
      //   'password': passwordController.value.text,
      // };

      // final response = await post(
      //   Uri.parse('https://reqres.in/api/login'),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode(newData),
      // );

      // 1
      // final response = await get(
      //     Uri.parse('https://reqres.in/api/users/23'),
      //     // body: {'email': emailController.value.text,'password': passwordController.value.text,}
      //   );

      // 2
      // final response = await post(
      //   Uri.parse('https://reqres.in/api/users'),
      //   body: {
      //       "name": "morpheus",
      //       "job": "leader",
      //   }
      // );

      // 3
      // final response = await patch(
      //   Uri.parse('https://reqres.in/api/users/2'),
      //   body: {
      //       "name": "morpheus",
      //       "job": "zion resident"
      //   }
      // );

      // 4
      // final response = await delete(
      //   Uri.parse('https://reqres.in/api/users/2'),
      // );

      // 5
      // final response = await post(
      //   Uri.parse('https://reqres.in/api/login'),
      //   body: {
      //     "email":emailController.value.text,
      //     "password":passwordController.value.text,
      //   }
      // );

      //6
      final response = await get(
        Uri.parse('https://reqres.in/api/users?delay=3'),
      );

      var data = jsonDecode(response.body); // response token
      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login succesful', 'success');
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}