import 'package:aurora_fruts/models/collection.dart';
import 'package:flutter/widgets.dart';

class CollectionProvider with ChangeNotifier {
  Collection _collection = Collection();

  Collection get collection => _collection;
  set collection(Collection newCollection) {
    _collection = newCollection;
    notifyListeners();
  }
}
