import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_app/model/quote_model.dart';
import 'package:quotes_app/res/url.dart';

class QuoteRepository {
  Future<Quote?> fetchQuote() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.quotesUrl),
        headers: {'X-Api-Key': AppUrls.x_api_key},
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return Quote.fromJson(data[0]);
        }
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
