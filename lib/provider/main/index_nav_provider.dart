// MENAMBAHKAN INDEXNAVPROVIDER

// 1. mengganti state indexBottomNavBar pada mainscree.dart menjadi sebuah provider.

import 'package:flutter/cupertino.dart';

class IndexNavProvider extends ChangeNotifier {
  // 2. Berikan nilai _indexBottomNavBar di muali dari index 0
  int _indexBottomNavBar = 0;

  // 3. Beri getter-setter untuk mengakses dan memperbarui nilai state _indexBottomNavBar. Jangan lupakan method notifylistener()  upaya dapat didengar oleh widget.
  int get indexBottomNavBar => _indexBottomNavBar;

  set setIndexBottomNavBar(int value) {
    _indexBottomNavBar = value;
    notifyListeners();
  }
}
