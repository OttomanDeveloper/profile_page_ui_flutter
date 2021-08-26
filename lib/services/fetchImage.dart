import 'dart:convert';

import 'package:http/http.dart' as http;

final Uri api =
    Uri.parse("http://192.168.1.7/profilePageTutorial/get_image.php");

Future<dynamic> fetchImage({required String id}) async {
  try {
    final res = await http.post(api, body: {"id": id});
    print("Result: ${res.body}");
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        return json.decode(res.body);
      }
    }
    return '';
  } catch (e) {
    print("Error: $e");
    return '';
  }
}
