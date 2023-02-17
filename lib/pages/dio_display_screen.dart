import 'package:flutter/material.dart';
import 'package:learn_parsing_data_json_dart/services/user_sevice_with_dio.dart';

import '../model/user.dart';
import '../widgets/tag_widget.dart';

class DioDisplayUser extends StatefulWidget {
  const DioDisplayUser({super.key});

  @override
  State<DioDisplayUser> createState() => _DioDisplayUserState();
}

class _DioDisplayUserState extends State<DioDisplayUser> {
  bool dataFetched = false;
  User? dio= User(id: 2, email: "email", firstName: 'firstName', lastName: 'lastName', avatar: "avatar") ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Latihan dio"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (dataFetched && dio != null)
                ? MyUserTag(email: dio!.email,id: dio!.id.toString(),name: "${dio!.firstName} ${dio!.lastName}",)
                : Text(
                    "Belum ada data",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                  ),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: ()async {
                    User? dito = await DioService.fetchData(2) ;
                    print(dio);
                    dataFetched = !dataFetched;
                    setState(() {
                      dio=dito;
                    });
                  },
                  child: const Text("Save"),
                  ),
                  
                  const SizedBox(
                  height: 20.0,
                  ),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {},
                  child: const Text("post"),
                  ),
                  
          ],
        ),
      ),
    );
  }
}
