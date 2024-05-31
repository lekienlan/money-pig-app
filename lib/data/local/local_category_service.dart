import 'dart:developer';

import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'local_database_service.dart';

class LocalCategoryService {
  final LocalDatabaseService _localDb = LocalDatabaseService.instance;

  Future<void> createCategory(CategoryModel data) async {
    String transactionId = Uuid().v4();
    final Database db = await _localDb.database;

    await db.insert('categories', {
      'id': transactionId,
      "name": data.name,
      "code": data.code,
      'updated_at': DateTime.now().toIso8601String(),
      'created_at': DateTime.now().toIso8601String(),
      'type': data.type?.stringValue,
    });
  }

  Future<List<CategoryModel>> getCategoryListing(
      {List<TransactionTypeEnum>? types}) async {
    final Database db = await _localDb.database;
    // Generate the SQL query string

    String query = "SELECT * FROM categories ";

    if (isTruthy(types?.length)) {
      query += "WHERE type IN (";
      for (int i = 0; i < (types?.length ?? 0); i++) {
        query += "'${types?[i].stringValue}'";
        if (i < (types?.length ?? 0) - 1) {
          query += ", ";
        }
      }
      query += ")";
    }

    query += "ORDER BY created_at DESC;";

    final List<Map<String, dynamic>> list = await db.rawQuery(query);
    return list
        .map((item) => CategoryModel.fromJson({
              "id": item["id"],
              "name": item["name"],
              "type": item["type"],
              "code": item["code"],
              "created_at": item["created_at"],
              "updated_at": item["updated_at"],
            }))
        .toList();
  }
}
