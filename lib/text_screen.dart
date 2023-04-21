import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hello_google_maps/response_data.dart';

import 'api.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  List<User> users = [];

  late Api _api;

  @override
  void initState() {
    _api = Api(Dio());
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    ResponseData data = await _api.getUsers();
    List<User> loadedUsers = [];
    for (var user in data.data) {
      loadedUsers.add(User(
        name: user.name,
        cargo: user.cargo,
        email: user.email,
        age: user.age,
        latitude: user.latitude,
        longitude: user.longitude,
      ));
    }
    setState(() {
      users = loadedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Usuários"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return ListTile(
            title: Text("${user.name} - ${user.cargo}"),
            subtitle: Text("Email: ${user.email}"),
            contentPadding: const EdgeInsets.only(left: 10),
            onTap: () {
              Navigator.pushNamed(context, '/map');
            },
          );
        },
      ),
    );
  }
}
