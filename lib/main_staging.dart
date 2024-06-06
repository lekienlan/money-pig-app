import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:money_pig/shared/theme/assets.gen.dart';
import 'package:money_pig/start.dart';

import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.staging;
  await dotenv.load(fileName: Assets.env.envStaging);
  await start();
}
