import 'package:flutter/material.dart';
import 'package:todo1/db/db_helper.dart';
import 'package:todo1/services/notification_services.dart';
import 'package:todo1/services/theme_services.dart';
import 'package:todo1/ui/pages/notification_screen.dart';
import 'package:get/get.dart';
import 'package:todo1/ui/size_config.dart';
import 'package:todo1/ui/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/pages/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotifyHelper().requestAndroidPermissions();
  NotifyHelper().initializeNotification();

  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,

      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
