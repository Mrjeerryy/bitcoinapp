import 'dart:convert';
import 'package:bitcoinapp/iosandord.dart';

import 'package:http/http.dart' as http;

var time = "0";

class Networking {
  Future<String> get1Data(String index, String curency) async {
    print("$selectedcurrency#%%%%%%%%%%%%%%%,$index");
    String apiUrl =
        "https://rest.coinapi.io/v1/exchangerate/${index}/${curency}";
    String apiKey = "F49EF9F3-B437-41CD-89B3-88CFF253A472";

    // "36D8EC78-9A40-4266-99E5-9ABA25299A55";
    try {
      http.Response response = await http.get(
        Uri.parse("$apiUrl?apikey=$apiKey"),
      );

      if (response.statusCode == 200) {
        // The API call was successful, you can process the response here
        print("API Response: ${response.body}");

        Map<String, dynamic> data = jsonDecode(response.body);
        // Access the desired properties directly
        var coindata = data["rate"];
        time = data["time"];

        return coindata.toString(); // Assuming coindata is a numeric value
      } else {
        // If the API call failed, throw an exception
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      // Handle any exceptions that occurred during the API call
      return "Error: $error";
    }
  }
}
