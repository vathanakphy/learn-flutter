import 'package:basic/spotify/data/repositories/setting/app_setting_repository.dart';
import 'package:flutter/widgets.dart';
 
import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository _repository;
  AppSettings? _appSettings;

  AppSettingsState(this._repository){
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await _repository.load();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await _repository.save(_appSettings!);
    notifyListeners();
  }
}
