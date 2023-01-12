import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class QuotesAPIHelper {
  QuotesAPIHelper._();

  static final QuotesAPIHelper quotesAPIHelper = QuotesAPIHelper._();

  String myUrl = 'https://api.quotable.io/quotes';

  Future<QuotesAPI?> fetchRandomQuote() async {
    http.Response res =
        await http.get(Uri.parse("https://api.quotable.io/random"));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodes = jsonDecode(res.body);

      QuotesAPI randomQuote = QuotesAPI.fromJSON(decodes,
          "https://source.unsplash.com/random/1?background,nature,dark");

      return randomQuote;
    }
    return null;
  }

  Future<List<QuotesAPI>?> fetchnewQuotes() async {
    String myUrl = "https://api.quotable.io/quotes";
    http.Response res = await http.get(Uri.parse(myUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List decodes = data["results"];
      List<String> imgL = [];

      for (int i = 0; i < decodes.length; i++) {
        imgL.add(
            "https://source.unsplash.com/random/${i + 1}?background,nature,dark");
      }

      List<QuotesAPI> newQuotes = decodes
          .map((e) => QuotesAPI.fromJSON(e, imgL[decodes.indexOf(e)]))
          .toList();

      return newQuotes;
    }
    return null;
  }

  Future<List<QuotesAPI>?> fetchQuotes(
      {required bool iscategory, required String name}) async {
    String myUrl = (iscategory)
        ? 'https://api.quotable.io/quotes/?author=$name'
        : 'https://api.quotable.io/quotes/?tags=$name';

    http.Response res = await http.get(Uri.parse(myUrl));

    List<String> imgL = [];
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List decodes = data["results"];

      for (int i = 0; i < decodes.length; i++) {
        imgL.add(
            "https://source.unsplash.com/random/${i + 1}?background,$name,dark");
      }

      List<QuotesAPI> quotesList = decodes
          .map((e) => QuotesAPI.fromJSON(e, imgL[decodes.indexOf(e)]))
          .toList();

      return quotesList;
    }
    return null;
  }
}
