import '../api/config_api.dart';
import '../model/config/config_model.dart';

class ConfigController {
  final _configApi = ConfigApi();

  Future<ConfigModel> show() async {
    final results = await _configApi.show();

    return results;
  }

  Future<void> update(ConfigModel configModel) async {
    await _configApi.update(configModel);
  }
}
