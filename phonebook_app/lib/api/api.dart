import 'dart:convert';
import 'package:http/http.dart' as http;
final uri = Uri.parse('http://10.0.2.2:2000/');
class contactAPI {
  Future<List> getContacts() async {
    final Map data;
    http.Response response = await http.get(uri);
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data['fetchedInfo'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List> deleteContact(String id) async {
    final Map data;
    http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:2000/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data['fetchedInfo'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}









