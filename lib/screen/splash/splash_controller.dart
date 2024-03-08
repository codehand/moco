import 'package:get/get.dart';
import 'package:moco/models/config.dart';

import 'splash_repo.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  final ConfigModel _configModel = ConfigModel();
  bool _firstTimeConnectionCheck = true;
  final bool _hasConnection = true;
  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  DateTime get currentTime => DateTime.now();
  ConfigModel get configModel => _configModel;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  bool get hasConnection => _hasConnection;

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}