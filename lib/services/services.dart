import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final String _url =
      'https://kelompok4-dot-personal-website-415207.et.r.appspot.com';

  var token = "";

  _getToken() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    token = jsonDecode(local.getString('token')!)['token'];
  }

  auth(data, String apiURL) async {
    var fullUrl = _url + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }
}
