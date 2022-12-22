import 'package:get_it/get_it.dart';
import 'package:landing_page/providers/page_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PageProvider());
}
