import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';
import 'api_helper.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "LifeQuotes.db";
  final String colDbId = "id";
  final String dbQuote = "quote";
  final String dbAuth = "author";
  final String dbImg = "image";

  Database? db;

  Future<void> initDB({required String tableName}) async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    String query =
        "CREATE TABLE IF NOT EXISTS $tableName($colDbId INTEGER PRIMARY KEY AUTOINCREMENT, $dbQuote TEXT, $dbAuth TEXT, $dbImg TEXT);";

    await db?.execute(query);
  }

  insertRandomQuote({required String tableName}) async {
    await initDB(tableName: tableName);
    final prefs = await SharedPreferences.getInstance();
    bool isTableEmpty = prefs.getBool('isTable${tableName}Empty') ?? true;

    QuotesAPI? res = await QuotesAPIHelper.quotesAPIHelper.fetchRandomQuote();

    if (isTableEmpty) {
      String query =
          "INSERT INTO $tableName($dbQuote, $dbAuth, $dbImg) VALUES(?, ?, ?);";
      List args = [
        res!.quote,
        res.author,
        res.image,
      ];

      await db?.rawInsert(query, args);

      await prefs.setBool('isTable${tableName}Empty', false);
    } else {
      String query =
          "UPDATE $tableName SET $dbQuote=?, $dbAuth=?, $dbImg=? WHERE $colDbId=?;";
      List args = [
        res!.quote,
        res.author,
        res.image,
        1,
      ];
      await db?.rawUpdate(query, args);
    }
  }

  Future<List<QuotesDB>?> fetchRandomQuote({required String tableName}) async {
    await insertRandomQuote(tableName: tableName);
    String query = "SELECT * FROM $tableName;";
    List<Map<String, dynamic>>? res = await db?.rawQuery(query);
    List<QuotesDB>? randomQuote = res?.map((e) => QuotesDB.fromAPI(e)).toList();
    return randomQuote;
  }

  insertLatestQuotes({required String tableName}) async {
    await initDB(tableName: tableName);
    final prefs = await SharedPreferences.getInstance();
    bool isTableEmpty = prefs.getBool('isTable${tableName}Empty') ?? true;

    List? res = await QuotesAPIHelper.quotesAPIHelper.fetchLatestQuotes();

    if (isTableEmpty) {
      for (int i = 0; i < res!.length; i++) {
        String query =
            "INSERT INTO $tableName($dbQuote, $dbAuth, $dbImg) VALUES(?, ?, ?);";
        List args = [
          res[i].quote,
          res[i].author,
          res[i].image,
        ];
        await db?.rawInsert(query, args);
      }

      prefs.setBool('isTable${tableName}Empty', false);
    } else {
      for (int i = 0; i < res!.length; i++) {
        String query =
            "UPDATE $tableName SET $dbQuote=?, $dbAuth=?, $dbImg=? WHERE $colDbId=?;";
        List args = [
          res[i].quote,
          res[i].author,
          res[i].image,
          i + 1,
        ];

        await db?.rawUpdate(query, args);
      }
    }
  }

  Future<List<QuotesDB>?> fetchLatestQuotes({required String tableName}) async {
    await insertLatestQuotes(tableName: tableName);

    String query = "SELECT * FROM $tableName;";

    List<Map<String, dynamic>>? data = await db?.rawQuery(query);

    List<QuotesDB>? latestQuotes =
        data?.map((e) => QuotesDB.fromAPI(e)).toList();

    return latestQuotes;
  }

  insertRecord({required String tableName, required bool isAuthCat}) async {
    await initDB(tableName: tableName);

    List? data = await QuotesAPIHelper.quotesAPIHelper
        .fetchQuotes(isAuthCat: isAuthCat, name: tableName);

    final prefs = await SharedPreferences.getInstance();
    bool isTableEmpty = prefs.getBool('isTable${tableName}Empty') ?? true;

    if (isTableEmpty) {
      for (int i = 0; i < data!.length; i++) {
        String query =
            "INSERT INTO $tableName($dbQuote, $dbAuth, $dbImg) VALUES(?, ?, ?);";
        List args = [
          data[i].quote,
          data[i].author,
          data[i].image,
        ];

        await db?.rawInsert(query, args);
      }
      prefs.setBool('isTable${tableName}Empty', false);
    }
  }

  Future<List<QuotesDB>> fetchAllRecords(
      {required String tableName, required bool isAuthCat}) async {
    await insertRecord(tableName: tableName, isAuthCat: isAuthCat);

    String query = "SELECT * FROM $tableName;";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);
    List<QuotesDB> AllQuotes =
        allQuotes.map((e) => QuotesDB.fromAPI(e)).toList();

    return AllQuotes;
  }
}
