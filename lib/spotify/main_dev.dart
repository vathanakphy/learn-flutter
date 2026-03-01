import 'package:basic/spotify/data/repositories/setting/app_setting_repository.dart';
import 'package:basic/spotify/data/repositories/setting/app_settings_repository_mock.dart';
import 'package:basic/spotify/ui/states/player_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  AppSettingsRepository appSettingsRepository = AppSettingsRepositoryMock();
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),
    ChangeNotifierProvider<PlayerState>(create: (context) => PlayerState()),
    // 3 - Inject the  app setting state
        ChangeNotifierProvider<AppSettingsState>(
      create: (context) => AppSettingsState(appSettingsRepository),
    ),

  ];
}

void main() {
  mainCommon(devProviders);
}
