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
      Map<String,dynamic> data = response.data['data'];

      if (response.statusCode != 200) {
        return null;
      }
      return User.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
