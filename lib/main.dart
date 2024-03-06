import 'package:employeeapp/core/utils/initstate_app_utils.dart';
import 'package:employeeapp/core/utils/logger.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:employeeapp/routes/routes.dart';
import 'package:employeeapp/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      title: 'Flutter Demo',
      theme: theme,
      getPages: Routes.getPages(),
      initialRoute: RouteList.initial,
      debugShowCheckedModeBanner: false,
    );
  }
}
