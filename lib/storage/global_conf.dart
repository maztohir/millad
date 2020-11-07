import 'package:global_configuration/global_configuration.dart';

const IS_DARK = 'isDark';
const APP_SETTINGS = 'app_settings';

bool isDark() {
  return GlobalConfiguration().get(IS_DARK);
}
