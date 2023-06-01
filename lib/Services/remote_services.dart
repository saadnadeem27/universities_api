import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<dynamic>> unimodel() async {
    http.Client client = http.Client();
    Uri uri =
        Uri.parse('http://universities.hipolabs.com/search?country=Pakistan');
    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
