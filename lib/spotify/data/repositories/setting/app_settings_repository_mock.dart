import 'package:basic/spotify/model/settings/app_settings.dart';
import 'package:basic/spotify/data/repositories/setting/app_setting_repository.dart';

class AppSettingsRepositoryMock implements AppSettingsRepository {
  AppSettings _current = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    return _current;
  }

  @override
  Future<void> save(AppSettings settings) async {
    _current = settings;
  }
}
