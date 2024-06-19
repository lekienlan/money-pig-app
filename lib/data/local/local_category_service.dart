import 'dart:convert';

import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/model/style_model.dart';
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
      'style': jsonEncode(data.style?.toJson())
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
    return list.map((item) {
      return CategoryModel.fromJson({
        "id": item["id"],
        "name": item["name"],
        "type": item["type"],
        "code": item["code"],
        "created_at": item["created_at"],
        "updated_at": item["updated_at"],
        "style": StyleModel.fromJson(jsonDecode(item["style"])).toJson()
      });
    }).toList();
  }

  Future<CategoryModel> getCategoryDetail(String id) async {
    final Database db = await _localDb.database;
    final List<Map<String, dynamic>> results = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      final Map<String, dynamic> item = results.first;
      return CategoryModel.fromJson({
        "id": item["id"],
        "name": item["name"],
        "type": item["type"],
        "code": item["code"],
        "created_at": item["created_at"],
        "updated_at": item["updated_at"],
        "style": StyleModel.fromJson(jsonDecode(item["style"])).toJson()
      });
    } else {
      throw Exception('Category not found');
    }
  }

  Future<void> updateCategory(CategoryModel data) async {
    final Database db = await _localDb.database;

    await db.update(
      'categories',
      {
        "name": data.name,
        "code": data.code,
        'updated_at': DateTime.now().toIso8601String(),
        'type': data.type?.stringValue,
        'style': jsonEncode(data.style?.toJson())
      },
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  Future<void> deleteCategory(String id) async {
    final Database db = await _localDb.database;

    await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
