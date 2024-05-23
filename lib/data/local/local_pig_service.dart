import 'package:money_pig/domain/model/pig_card_model.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'local_database_service.dart';

class LocalPigService {
  final LocalDatabaseService _localDb = LocalDatabaseService.instance;

  Future<void> createPig(PigCardModel data) async {
    final Database db = await _localDb.database;
    String pigId = Uuid().v4();
    String periodId = Uuid().v4();
    String transactionId = Uuid().v4();
    String? id = await getDeviceId();

    await db.transaction((txn) async {
      await txn.insert('pigs', {
        'id': pigId,
        'name': data.name,
        'style': '{}',
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

  Future<List<PigCardModel>> getPigListing() async {
    final Database db = await _localDb.database;

    // await _localDb.dropTables();

    final List<Map<String, dynamic>> list = await db.rawQuery('''
    SELECT
      pigs.*,
      periods.id as period_id,
      periods.start_date,
      periods.end_date,
      transactions.id as transaction_id,
      transactions.amount,
      transactions.period_id as transaction_period_id
    FROM pigs
    LEFT JOIN periods ON pigs.id = periods.pig_id
    LEFT JOIN transactions ON periods.id = transactions.period_id
     WHERE transactions.type = 'budget'
    ORDER BY pigs.created_at DESC
  ''');

    return list
        .map((item) => PigCardModel.fromJson({
              'id': item['id'],
              'name': item['name'],
              'start_date': item['start_date'],
              'end_date': item['end_date'],
              'updated_at': item['updated_at'],
              'created_at': item['created_at'],
              'status': item['status'],
              'budget': item['amount'],
            }))
        .toList();
  }

  Future<PigCardModel> getPigDetail(String id) async {
    final Database db = await _localDb.database;

    // await _localDb.dropTables();

    final List<Map<String, dynamic>> list = await db.rawQuery('''
    SELECT
      pigs.*,
      periods.id as period_id,
      periods.start_date,
      periods.end_date,
      transactions.id as transaction_id,
      transactions.amount,
      transactions.period_id as transaction_period_id
    FROM pigs
    LEFT JOIN periods ON pigs.id = periods.pig_id
    LEFT JOIN transactions ON periods.id = transactions.period_id
     WHERE transactions.type = 'budget' AND pigs.id = '${id}'
    ORDER BY pigs.created_at DESC
  ''');

    if (list.isNotEmpty) {
      final item = list.first;
      return PigCardModel.fromJson({
        'id': item['id'],
        'name': item['name'],
        'start_date': item['start_date'],
        'end_date': item['end_date'],
        'updated_at': item['updated_at'],
        'created_at': item['created_at'],
        'status': item['status'],
        'budget': item['amount'],
      });
    } else {
      throw Exception('Pig not found');
    }
  }
}
