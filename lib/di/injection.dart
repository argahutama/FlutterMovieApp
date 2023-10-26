import 'package:common/common.dart';
import 'package:common/di/injection.dart';

import './injection.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> getDependencies() async {
  await getIt.init();
}
