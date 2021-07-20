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

  Future<Map> createContact() async {
    final Map data;
    http.Response response = await http.post(Uri.parse(uri),
      headers: _header,
      
    );

    data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return data['fetchedInfo'];
    } else {
      throw await Exception('Failed to add data');
    }
  }
}

// class contactInsert {
//   String first_name;
//   String last_name;
//   // List<String> phone_numbers;

//   contactInsert({required this.first_name, required this.last_name,});

//   Map<String, dynamic> toJson() {
    
//     return {
//       "first_name": first_name,
//       "last_name": last_name,
//     };
//   }
// }









