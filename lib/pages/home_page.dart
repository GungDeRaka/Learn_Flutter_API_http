import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_parsing_data_json_dart/model/sample.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// [result] will store the data u've fetched from dummy API [assets/dummy.json]
  Sample? result;

  ///[_getJsonData] Will fetch data from dummy, decode it and store it in [result]
  Future _getJsonData() async {
    String getJson = await rootBundle.loadString("assets/dummy.json");
    Sample sample = Sample.fromJsom(jsonDecode(getJson));
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Learn Data Table and Parsing Data"),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (result == null) ? "belum ada data" : "${result!.articles![0]}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                (result == null) ? "belum ada data" : "$result",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    result = null;
                  });
                },
                child: const Text("Save"),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                (result == null)
                    ? "belum ada data"
                    : result!.github.repositories.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getJsonData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
