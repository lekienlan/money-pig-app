import 'dart:convert';
import 'dart:developer';

import 'package:money_pig/domain/model/style_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'local_database_service.dart';

class LocalTransactionService {
  final LocalDatabaseService _localDb = LocalDatabaseService.instance;

  Future<void> createTransaction(TransactionModel data) async {
    String transactionId = Uuid().v4();
    final Database db = await _localDb.database;

    log('$data');
    await db.insert('transactions', {
      'id': transactionId,
      'updated_at': DateTime.now().toIso8601String(),
      'created_at': DateTime.now().toIso8601String(),
      'date': DateTime.now().toIso8601String(),
      'amount': data.amount,
      'note': data.note,
      'type': data.type?.stringValue,
      'status': 'active',
      'period_id': data.period_id,
      'category_id': data.category_id
    });
  }

  Future<num> getTransactionAmount({TransactionTypeEnum? type}) async {
    final Database db = await _localDb.database;

    final List<Map<String, dynamic>> resp = await db.rawQuery('''
      SELECT SUM(amount) AS totalAmount FROM transactions
      WHERE type = '${type?.stringValue}'
  ''');

    num sum = (resp.isNotEmpty && resp[0]['totalAmount'] != null)
        ? resp[0]['totalAmount'] as double
        : 0.0;

    return sum;
  }

  Future<List<TransactionModel>> getTransactionListing(
      {List<TransactionTypeEnum>? types, String? period_id}) async {
    final Database db = await _localDb.database;
    // Generate the SQL query string
    String query =
        "SELECT transactions.*, categories.name AS category_name, categories.style AS category_style FROM transactions LEFT JOIN categories ON transactions.category_id = categories.id";
    if (isTruthy(types?.length)) {
      query += " WHERE transactions.type IN (";
      for (int i = 0; i < (types?.length ?? 0); i++) {
        query += "'${types?[i].stringValue}'";
        if (i < (types?.length ?? 0) - 1) {
          query += ", ";
        }
      }
      query += ") ";
    }
    if (isTruthy(period_id)) {
      query += "AND transactions.period_id = '$period_id' ";
    }

    query += "ORDER BY created_at DESC;";

    final List<Map<String, dynamic>> list = await db.rawQuery(query);

    log("$list");
    return list
        .map((item) => TransactionModel.fromJson({
              "id": item["id"],
              "amount": item["amount"],
              "type": item["type"],
              "note": item["note"],
              "created_at": item["created_at"],
              "period_id": item["period_id"],
              "category_id": item["category_id"],
              "status": item["status"],
              "category": {
                "name": item["category_name"],
                "id": item["category_id"],
                "style": StyleModel.fromJson(
                        jsonDecode(item["category_style"] ?? "{}"))
                    .toJson()
              }
            }))
        .toList();
  }
}
