import 'package:dio/dio.dart';
import 'package:learn_parsing_data_json_dart/model/user.dart';

abstract class DioService {
  static Future<User?> fetchData(int id) async {
    try {
      final response = await Dio().get(
        "https://reqres.in/api/users/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      Map<String, dynamic> data = response.data['data'];

      if (response.statusCode != 200) {
        return null;
      }
      return User.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<User?> createUSer(
      String firstName, String lastName, String email) async {
    try {
      var response = await Dio().post(
        "https://reqres.in/api/users",
        // options: Options(
        //   headers: {
        //     "Content-Type": "application/json",
        //   },
        // ),
        data: {
          "first_name": firstName,
          "last_name": lastName,
          'email': email,
        },
      );

      print(response);
      print('-----------------');
      print(response.statusCode);
      // Map<String, dynamic> data = response.data;
      if (response.statusCode != 201) {
        return null;
      }
      return User(
          id: int.tryParse(response.data['id']) ?? 0,
          email: response.data['email'],
          firstName: response.data["first_name"],
          lastName: response.data['last_name'],
          avatar: null);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
