import 'package:flutter/material.dart';

class MyUserTag extends StatelessWidget {
  const MyUserTag({super.key, this.id, this.name, this.email});
  final String? id;
  final String? name;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(
          width: 1.2,
          color: Colors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
          height: 20.0,
          ),
          Text(
            "ID : $id",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Name : $name",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Email : $email",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      ),
    );
  }
}
