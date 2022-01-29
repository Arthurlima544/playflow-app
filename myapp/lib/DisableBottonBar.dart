import 'package:flutter/services.dart';

disableBottomBarAndTopBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
