import 'dart:developer';

import 'package:money_pig/domain/model/pig_card_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'local_database_service.dart';

class LocalTransactionService {
  final LocalDatabaseService _localDb = LocalDatabaseService.instance;

  Future<void> createTransaction(TransactionModel data) async {
    String transactionId = Uuid().v4();
    final Database db = await _localDb.database;

    await db.insert('transactions', {
      'id': transactionId,
      'updated_at': DateTime.now().toIso8601String(),
      'created_at': DateTime.now().toIso8601String(),
      'date': DateTime.now().toIso8601String(),
      'amount': data.amount,
      'type': data.type?.stringValue,
      'status': 'active'
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

  Future<TransactionModel> getTransaction() async {
    final Database db = await _localDb.database;
    return TransactionModel();
  }
}
