import 'dart:convert';
import 'package:http/http.dart' as http;
final uri = Uri.parse('https://rs-phonebook.herokuapp.com/');
class contactAPI {
  Future<List> getContacts() async {
    final Map data;
    http.Response response = await http.get(uri);
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return await data['fetchedInfo'];
    } else {
      throw await Exception('Failed to load data');
    }
  }

  Future<String> deleteContact(String id) async {
    final Map data;
    http.Response response = await http.delete(
      Uri.parse('$uri$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return await data['fetchedInfo'];
    } else {
      throw await Exception('Failed to load data');
    }
  }
}









