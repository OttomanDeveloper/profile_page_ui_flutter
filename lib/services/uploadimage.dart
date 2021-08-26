import 'package:http/http.dart' as http;

final Uri api = Uri.parse("http://192.168.1.7/profilePageTutorial/upload.php");

Future<bool> uploadImage({required String image}) async {
  try {
    final res = await http.post(api, body: {"image": image});
    print("Result: ${res.body}");
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        return true;
      }
    }
    return false;
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
