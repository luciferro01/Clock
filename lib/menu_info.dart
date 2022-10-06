import 'package:clock_application/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? image;

  MenuInfo(this.menuType, {this.title, this.image});

  updateMenuInfo(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    image = menuInfo.image;
    title = menuInfo.title;

    notifyListeners();
  }
}
