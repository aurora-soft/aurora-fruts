import 'package:aurora_fruts/models/provider.dart';
import 'package:flutter/widgets.dart';

class ProviderProvider with ChangeNotifier{
  Provider _provider = Provider();

  Provider get provider => _provider;
  set provider(Provider newProvider){
    _provider = newProvider;
    notifyListeners();
  }
}