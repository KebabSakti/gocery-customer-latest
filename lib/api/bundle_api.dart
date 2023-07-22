import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/bundle/bundle_model.dart';

class BundleApi {
  final _http = NetworkClient();

  Future<List<BundleModel>> index() async {
    final request = await _http.get(bundle);
    final json = await compute(parseJson, request.body);

    final bundles =
        List<BundleModel>.from(json.map((item) => BundleModel.fromJson(item)));

    return bundles;
  }
}
