import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:money_pig/gen/assets.gen.dart';
import 'package:money_pig/start.dart';

Future<void> main() async {
  await dotenv.load(fileName: Assets.env.envStaging);

  await start();
}
