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

  Future<Null> deleteContact(String id) async {
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

  Future<contactInfo> createContact(String fsName, lsName) async {
    // final Map data;
    http.Response response = await http.post(Uri.parse(uri),
      headers: _header,
      body: jsonEncode(<String, String> {
        'first_name': fsName,
        'last_name': lsName
      })
    );

    if (response.statusCode == 201) {
      return contactInfo.fromJson(jsonDecode(response.body));
    } else {
      throw await Exception('Failed to add data');
    }
  }
}

class contactInfo {
  String fsName;
  String lsName;
  // List<String> phNumbers;

  contactInfo({
    required this.fsName,
    required this.lsName,
    // required this.phNumbers
  });

  factory contactInfo.fromJson(Map<String, dynamic> json) {
    return contactInfo(
      fsName: json['first_name'],
      lsName: json['last_name'],
      // phNumbers: json['phone_numbers'],
    );
  }
}











