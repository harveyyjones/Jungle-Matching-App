import 'dart:convert';
import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://mocki.io/v1/968c0b60-cb56-4cf4-9d17-ff53f32f91e7";
  Future<UsersModel?> fetchUsers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
