import 'dart:convert';
import 'package:http/http.dart' as http;
const uri = 'https://rs-phonebook.herokuapp.com/';
const Map<String, String> _header =  {
        'Content-Type': 'application/json; charset=UTF-8',
      };
class contactAPI {
  Future<List> getContacts() async {
    final Map data;
    http.Response response = await http.get(Uri.parse(uri));
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return await data['fetchedInfo'];
    } else {
      throw await Exception('Failed to load data');
    }
  }

  Future<String> deleteContact(String id) async {
    final Map data;
    http.Response response = await http.delete(Uri.parse('$uri$id'),
      headers: _header
    );
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return await data['fetchedInfo'];
    } else {
      throw await Exception('Failed to delete data');
    }
  }

  Future<List> updateContact() async {
    final Map data;
    http.Response response = await http.post(Uri.parse(uri),
      headers: _header
    );
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return await data['fetchedInfo'];
    } else {
      throw await Exception('Failed to update data');
    }
  }
}









