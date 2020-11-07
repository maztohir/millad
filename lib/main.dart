import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import './app.dart';
import 'storage/global_conf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset(APP_SETTINGS);
  runApp(MyApp());
}
