import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:learn_parsing_data_json_dart/services/user_service.dart';

import '../model/user.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  List<User> users = [];

  void fetchUser ()async{
    final result = await UserService.fetchUser();
    setState(() {
      users = result;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var user= users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage:  NetworkImage(
                  user.avatar!,
                ),
              ),
              title:  Text("${user.firstName!} ${user.lastName!}"),
              subtitle:  Text(user.email!),
            ),
          );
        },
      ),
    );
  }
}
