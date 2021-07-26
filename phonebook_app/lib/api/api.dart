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
      return  data['fetchedInfo'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Null> deleteContact(String id) async {
    final Map data;
    http.Response response = await http.delete(Uri.parse('$uri$id'),
      headers: _header
    );
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data['fetchedInfo'];
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<contactInfo> createContact(contactInfo item) async {
    http.Response response = await http.post(Uri.parse(uri),
      headers: _header,
      body: jsonEncode(item.toJson()),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      return contactInfo.fromJson(jsonDecode(response.body));
    } else {
      throw  Exception('Failed to add data');
    }
  }

  Future<contactInfo> updateContact(contactInfo item, String id) async {

    http.Response response = await http.put(Uri.parse('$uri$id'),
      headers: _header,
      body: jsonEncode(item.toJson()),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      return  contactInfo.fromJson(jsonDecode(response.body));
    } else {
      throw  Exception('Failed to save data');
    }
  }
}

class contactInfo {
  String fsName;
  String lsName;
  List<String> phNumbers;

  contactInfo({
    required this.fsName,
    required this.lsName,
    required this.phNumbers
  });

  factory contactInfo.fromJson(Map<String, dynamic> json) {
    final numbersList = json['phone_numbers'] as List<dynamic>;
    return contactInfo(
      fsName: json['first_name'],
      lsName: json['last_name'],
      phNumbers: numbersList.map((e) => e.toString()).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': this.fsName,
      'last_name': this.lsName,
      'phone_numbers': this.phNumbers,
    };
  }
}











