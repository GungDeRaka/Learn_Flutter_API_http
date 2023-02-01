import 'package:flutter/material.dart';
import 'package:learn_parsing_data_json_dart/services/user_service.dart';

import '../model/user.dart';

class HomePageStatelessFuture extends StatelessWidget {
  const HomePageStatelessFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatelessWidget and FutureBuilder"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: UserService.fetchUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var users = snapshot.data;
          if(snapshot.connectionState == ConnectionState.waiting)
          {return const Center(child: CircularProgressIndicator());}
          if(snapshot.hasError)
          {return const Center(child: Text("Errorr broo",
          style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          ),
          ),);}
          return ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var user = users[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(
                      user.avatar!,
                    ),
                  ),
                  title: Text("${user.firstName!} ${user.lastName!}"),
                  subtitle: Text(user.email!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
