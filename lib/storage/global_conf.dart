import 'package:global_configuration/global_configuration.dart';

const IS_DARK = 'isDark';
const APP_SETTINGS = 'app_settings';

bool isDark() {
  return GlobalConfiguration().get(IS_DARK);
}

void gotoDark() {
  GlobalConfiguration().updateValue(IS_DARK, true);
}

void gotoLight() {
  GlobalConfiguration().updateValue(IS_DARK, false);
}

void toggleLight() {
  if (isDark())
    gotoLight();
  else
    gotoDark();
}
