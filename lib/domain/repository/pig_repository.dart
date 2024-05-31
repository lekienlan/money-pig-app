import 'package:money_pig/data/local/local_pig_service.dart';
import 'package:money_pig/domain/model/pig_model.dart';

abstract class PigRepositoryProtocol {
  Future<List<PigModel>> getPigListing();
  Future<void> createPig(PigModel data);
  Future<PigModel> getPigDetail(String id);
}

class PigRepository implements PigRepositoryProtocol {
  LocalPigService pigService = LocalPigService();

  @override
  Future<void> createPig(PigModel data) async {
    try {
      await pigService.createPig(data);
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<List<PigModel>> getPigListing() async {
    try {
      return await pigService.getPigListing();
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<PigModel> getPigDetail(String id) async {
    try {
      return await pigService.getPigDetail(id);
    } catch (err) {
      throw Error();
    }
  }
}
