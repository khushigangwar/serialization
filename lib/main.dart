import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serialization/Usermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel userObject =
      UserModel(id: "001", fullname: "khushi", email: "khush@gmail.com");

  String userJson =
      '{"id":"001","fullname":"khushi","email":"khush@gmail.com"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //serialization
          ElevatedButton(
              onPressed: () {
                Map<String, dynamic> userMap = userObject.toMap();
                var json = jsonEncode(userMap);
                debugPrint(json.toString());
              },
              child: const Text("Serialize")),
          const SizedBox(
            width: 20,
          ),
          //deserialization
          ElevatedButton(
              onPressed: () {
                var decoded = jsonDecode(userJson);
                Map<String, dynamic> userMap = decoded;
                UserModel newUser = UserModel.fromMap(userMap);
                debugPrint(newUser.fullname.toString());
              },
              child: const Text("DeSerialize")),
        ]),
      )),
    );
  }
}
