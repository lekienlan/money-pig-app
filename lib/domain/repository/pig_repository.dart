import 'package:money_pig/data/local/local_pig_service.dart';
import 'package:money_pig/domain/model/pig_card_model.dart';

abstract class PigRepositoryProtocol {
  Future<List<PigCardModel>> getPigListing();
  Future<void> createPig(PigCardModel data);
}

class PigRepository implements PigRepositoryProtocol {
  LocalPigService pigService = LocalPigService();

  @override
  Future<void> createPig(PigCardModel data) async {
    try {
      await pigService.createPig(data);
    } catch (err) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<PigCardModel>> getPigListing() async {
    try {
      return await pigService.getPigListing();
    } catch (err) {
      throw UnimplementedError();
    }
  }
}
