import 'dart:convert';
import 'dart:developer';

import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/domain/model/style_model.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'local_database_service.dart';

class LocalPigService {
  final LocalDatabaseService _localDb = LocalDatabaseService.instance;

  Future<void> createPig(PigModel data) async {
    final Database db = await _localDb.database;
    String pigId = Uuid().v4();
    String periodId = Uuid().v4();
    String transactionId = Uuid().v4();
    String? id = await getDeviceId();

    await db.transaction((txn) async {
      await txn.insert('pigs', {
        'id': pigId,
        'name': data.name,
        'style': jsonEncode(data.style?.toJson()),
        'updated_at': DateTime.now().toIso8601String(),
        'created_at': DateTime.now().toIso8601String(),
        'user_id': id, // Assuming user_id is part of your schema
        'status': 'active'
      });

      await txn.insert('periods', {
        'id': periodId,
        'updated_at': DateTime.now().toIso8601String(),
        'created_at': DateTime.now().toIso8601String(),
        'start_date': data.start_date,
        'end_date': data.end_date,
        'pig_id': pigId,
        'status': 'active'
      });

      await txn.insert('transactions', {
        'id': transactionId,
        'updated_at': DateTime.now().toIso8601String(),
        'created_at': DateTime.now().toIso8601String(),
        'period_id': periodId,
        'date': DateTime.now().toIso8601String(),
        'amount': data.budget,
        'type': 'budget',
        'status': 'active'
      });
    });
  }

  Future<List<PigModel>> getPigListing() async {
    final Database db = await _localDb.database;

    await _localDb.printTableColumns('categories');

    // await _localDb.dropTables();

    final List<Map<String, dynamic>> list = await db.rawQuery('''
   SELECT
    pigs.*,
    periods.id AS period_id,
    periods.start_date,
    periods.end_date,
    IFNULL(budget_transactions.total_budget, 0) AS budget,
    IFNULL(expenses.total_expense, 0) AS expense
FROM pigs
LEFT JOIN periods ON pigs.id = periods.pig_id
LEFT JOIN (
    SELECT
        periods.pig_id,
        SUM(transactions.amount) AS total_budget
    FROM transactions
    JOIN periods ON transactions.period_id = periods.id
    WHERE transactions.type = 'budget'
    GROUP BY periods.pig_id
) AS budget_transactions ON pigs.id = budget_transactions.pig_id
LEFT JOIN (
    SELECT
        periods.pig_id,
        SUM(transactions.amount) AS total_expense
    FROM transactions
    JOIN periods ON transactions.period_id = periods.id
    WHERE transactions.type = 'expense'
    GROUP BY periods.pig_id
) AS expenses ON pigs.id = expenses.pig_id
WHERE pigs.status = 'active'
ORDER BY pigs.created_at DESC;
  ''');

    log("$list");

    return list
        .map((item) => PigModel.fromJson({
              'id': item['id'],
              'name': item['name'],
              'start_date': item['start_date'],
              'end_date': item['end_date'],
              'updated_at': item['updated_at'],
              'created_at': item['created_at'],
              'status': item['status'],
              'period_id': item['period_id'],
              'budget': item['budget'],
              'expense': item['expense'],
              "style": StyleModel.fromJson(jsonDecode(item["style"])).toJson()
            }))
        .toList();
  }

  Future<PigModel> getPigDetail(String id) async {
    final Database db = await _localDb.database;

    // await _localDb.dropTables();

    final List<Map<String, dynamic>> list = await db.rawQuery('''
SELECT
    pigs.*,
    periods.id AS period_id,
    periods.start_date,
    periods.end_date,
    IFNULL(budget_transactions.total_budget, 0) AS budget,
    IFNULL(expenses.total_expense, 0) AS expense
FROM pigs
LEFT JOIN periods ON pigs.id = periods.pig_id
LEFT JOIN (
    SELECT
        periods.pig_id,
        SUM(transactions.amount) AS total_budget
    FROM transactions
    JOIN periods ON transactions.period_id = periods.id
    WHERE transactions.type = 'budget'
    GROUP BY periods.pig_id
) AS budget_transactions ON pigs.id = budget_transactions.pig_id
LEFT JOIN (
    SELECT
        periods.pig_id,
        SUM(transactions.amount) AS total_expense
    FROM transactions
    JOIN periods ON transactions.period_id = periods.id
    WHERE transactions.type = 'expense'
    GROUP BY periods.pig_id
) AS expenses ON pigs.id = expenses.pig_id
WHERE pigs.id = '${id}'
ORDER BY pigs.created_at DESC;
  ''');

    if (list.isNotEmpty) {
      final item = list.first;
      return PigModel.fromJson({
        'id': item['id'],
        'name': item['name'],
        'start_date': item['start_date'],
        'end_date': item['end_date'],
        'updated_at': item['updated_at'],
        'created_at': item['created_at'],
        'status': item['status'],
        'period_id': item['period_id'],
        'budget': item['budget'],
        'expense': item['expense'],
        "style": StyleModel.fromJson(jsonDecode(item["style"])).toJson()
      });
    } else {
      throw Exception('Pig not found');
    }
  }

  Future<void> deletePig(String id) async {
    log("$id");
    final Database db = await _localDb.database;

    await db.transaction((txn) async {
      // Update pig status to inactive
      await txn.update(
        'pigs',
        {'status': 'inactive'},
        where: 'id = ?',
        whereArgs: [id],
      );

      // Update periods status to inactive
      await txn.update(
        'periods',
        {'status': 'inactive'},
        where: 'pig_id = ?',
        whereArgs: [id],
      );

      // Update transactions status to inactive
      await txn.update(
        'transactions',
        {'status': 'inactive'},
        where: 'period_id IN (SELECT id FROM periods WHERE pig_id = ?)',
        whereArgs: [id],
      );

      // Add refund income transaction
      final periodResult = await txn.rawQuery('''
        SELECT id FROM periods WHERE pig_id = ?
      ''', [id]);

      if (periodResult.isNotEmpty) {
        final periodId = periodResult.first['id'] as String;
        final refundTransactionId = Uuid().v4();

        final budgetResult = await txn.rawQuery('''
          SELECT IFNULL(SUM(amount), 0) AS total_budget 
          FROM transactions 
          WHERE period_id = ? AND type = 'budget'
        ''', [periodId]);

        final totalBudget = budgetResult.isNotEmpty
            ? budgetResult.first['total_budget'] as double
            : 0.0;

        if (totalBudget > 0) {
          await txn.insert('transactions', {
            'id': refundTransactionId,
            'updated_at': DateTime.now().toIso8601String(),
            'created_at': DateTime.now().toIso8601String(),
            'period_id': periodId,
            'note': 'refund income',
            'date': DateTime.now().toIso8601String(),
            'amount': totalBudget,
            'type': 'income',
            'status': 'active'
          });
        }
      }
    });
  }
}
