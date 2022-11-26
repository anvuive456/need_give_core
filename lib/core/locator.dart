import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupRepo() async {

  locator.registerSingleton<GlobalKey<NavigatorState>>(
    GlobalKey<NavigatorState>(),
  );

}
