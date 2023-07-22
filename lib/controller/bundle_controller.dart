import '../api/bundle_api.dart';
import '../model/bundle/bundle_model.dart';

class BundleController {
  final _bundleApi = BundleApi();

  Future<List<BundleModel>> index() async {
    final bundles = await _bundleApi.index();

    return bundles;
  }
}
